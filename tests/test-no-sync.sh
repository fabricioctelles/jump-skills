#!/bin/bash
# tests/test-no-sync.sh
# Garante que ninjas marcados como no-sync NÃO são clonados pelo sync-repos.sh.
#
# Por que este teste existe: clonar os repos do video-ninja adiciona ~483 MB
# (489 MB só do hyperframes) que não trazem nenhum ganho — as 42 skills já são
# consumidas como agent skills instaladas. A garantia é o array
# NEVER_CLONE_NINJAS no sync-repos.sh, mais o marcador `no-sync` no repos.md.
#
# Roda offline: `git` e `gh` são substituídos por stubs que só registram a chamada.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAILED=0

# Ninjas que nunca podem ser clonados: "ninja|regex de URLs que não podem aparecer"
FIXTURES=(
    "video-ninja|hyperframes|motion-video-kit|tugrawork-creator|Rieranthony|remotion-dev"
)

pass() { echo -e "  \033[0;32m✓\033[0m $1"; }
fail() { echo -e "  \033[0;31m✗\033[0m $1"; FAILED=1; }

# Monta um sandbox onde qualquer clone é interceptado
make_sandbox() {
    local dir="$1" repos_file="$2"
    rm -rf "$dir"
    mkdir -p "$dir/bin" "$dir/repo/repos"
    cp "$SCRIPT_DIR/sync-repos.sh" "$dir/repo/"
    cp "$SCRIPT_DIR/ninjas.md" "$dir/repo/"
    cp "$repos_file" "$dir/repo/repos.md"
    : > "$dir/repo/.skills-map"   # evita erro pré-existente de sort com mapa ausente

    local cmd
    for cmd in git gh; do
        printf '#!/bin/bash\necho "%s $*" >> %s/calls.log\nexit 0\n' "$cmd" "$dir" \
            > "$dir/bin/$cmd"
        chmod +x "$dir/bin/$cmd"
    done
}

# Roda o sync para um ninja e devolve a contagem de clones das URLs proibidas
count_forbidden_clones() {
    local dir="$1" ninja="$2" pattern="$3"
    ( cd "$dir/repo" && PATH="$dir/bin:$PATH" ./sync-repos.sh "$ninja" > "$dir/out.log" 2>&1 ) || true
    [ -f "$dir/calls.log" ] || { echo 0; return; }
    grep -cE "$pattern" "$dir/calls.log" 2>/dev/null || echo 0
}

echo "test-no-sync: ninjas no-sync nunca são clonados"
echo

for fixture in "${FIXTURES[@]}"; do
    ninja="${fixture%%|*}"
    pattern="${fixture#*|}"
    echo "[$ninja]"

    # Cenário A: repos.md intacto
    SB="/tmp/opencode/sync-test-$ninja-a"
    make_sandbox "$SB" "$SCRIPT_DIR/repos.md"
    n=$(count_forbidden_clones "$SB" "$ninja" "$pattern")
    if [ "$n" -eq 0 ]; then
        pass "repos.md intacto: 0 clones de $pattern"
    else
        fail "repos.md intacto: $n clones de $pattern"
    fi

    # Cenário B: alguém apagou o marcador no-sync (regressão mais provável).
    # O array hardcoded no script tem que segurar.
    SB="/tmp/opencode/sync-test-$ninja-b"
    sed '/no-sync/d' "$SCRIPT_DIR/repos.md" > "/tmp/opencode/repos-nomarker.md"
    make_sandbox "$SB" "/tmp/opencode/repos-nomarker.md"
    if grep -q "no-sync" "$SB/repo/repos.md"; then
        fail "cenário B inválido: marcador ainda presente no fixture"
    fi
    n=$(count_forbidden_clones "$SB" "$ninja" "$pattern")
    if [ "$n" -eq 0 ]; then
        pass "sem marcador no-sync: 0 clones (garantia hardcoded segurou)"
    else
        fail "sem marcador no-sync: $n clones — GARANTIA QUEBRADA"
    fi

    # Cenário C: o ninja precisa constar em ninjas.md e repos.md
    if grep -qx "$ninja" <(sed -n '/^```ninjas$/,/^```$/p' "$SCRIPT_DIR/ninjas.md" | grep -v '^```' | grep -v '^$'); then
        pass "registrado em ninjas.md"
    else
        fail "ausente em ninjas.md"
    fi
    if grep -q "^## \[$ninja\]" "$SCRIPT_DIR/repos.md"; then
        pass "registrado em repos.md"
    else
        fail "ausente em repos.md"
    fi

    echo
done

# Nenhum OUTRO ninja pode estar na lista de bloqueio (bloquearia clone legítimo)
echo "[sanidade]"
blocked=$(sed -n '/^NEVER_CLONE_NINJAS=(/,/^)/p' "$SCRIPT_DIR/sync-repos.sh" \
    | grep -oP '^\s*"\K[^|]+' | sort -u)
declared=$(sed -n '/^```ninjas$/,/^```$/p' "$SCRIPT_DIR/ninjas.md" \
    | grep -v '^```' | grep -v '^$' | sort -u)
extra=$(comm -13 <(echo "$declared") <(echo "$blocked"))
if [ -z "$extra" ]; then
    pass "lista de bloqueio só contém ninjas declarados"
else
    fail "lista de bloqueio contém ninjas inexistentes: $extra"
fi

# Todo ninja bloqueado precisa estar declarado
missing=$(comm -23 <(echo "$blocked") <(echo "$declared"))
if [ -z "$missing" ]; then
    pass "todo ninja bloqueado está declarado em ninjas.md"
else
    fail "bloqueado mas não declarado: $missing"
fi

echo
if [ "$FAILED" -eq 0 ]; then
    echo -e "\033[0;32mPASS\033[0m"
    exit 0
else
    echo -e "\033[0;31mFAIL\033[0m"
    exit 1
fi
