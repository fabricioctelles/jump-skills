#!/bin/bash
# Verifies repository-level exclusions and the hardcoded large-repository guard.
# Runs offline by replacing gh and git with stubs that record clone attempts.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VIDEO_NINJA="video-ninja"
HYPERFRAMES="https://github.com/heygen-com/hyperframes"
THREEJS="https://github.com/scottstts/Threejs-Awesome-Graphics-Agent-Skills"
ANATOMY="https://github.com/wheresryan22/anatomy"
TMP_DIR="$(mktemp -d)"
FAILED=0
trap 'rm -rf "$TMP_DIR"' EXIT

pass() { echo -e "  \033[0;32m✓\033[0m $1"; }
fail() { echo -e "  \033[0;31m✗\033[0m $1"; FAILED=1; }

make_sandbox() {
    local dir="$1" repos_file="$2"
    mkdir -p "$dir/bin" "$dir/repo/repos"
    cp "$SCRIPT_DIR/sync-repos.sh" "$dir/repo/"
    cp "$SCRIPT_DIR/ninjas.md" "$dir/repo/"
    cp "$repos_file" "$dir/repo/repos.md"
    : > "$dir/repo/.skills-map"

    local cmd
    for cmd in git gh; do
        printf '#!/bin/bash\necho "%s $*" >> "%s/calls.log"\nexit 0\n' "$cmd" "$dir" \
            > "$dir/bin/$cmd"
        chmod +x "$dir/bin/$cmd"
    done
}

run_sync() {
    local dir="$1"
    ( cd "$dir/repo" && PATH="$dir/bin:$PATH" ./sync-repos.sh "$VIDEO_NINJA" > "$dir/out.log" 2>&1 ) || true
}

count_attempts() {
    local dir="$1" url="$2"
    # grep -c alone is not enough: it exits 1 on zero matches, which used to
    # append a second "0" to the capture. wc -l always prints a single number.
    local matches
    matches=$(grep -F "$url" "$dir/calls.log" 2>/dev/null | wc -l)
    echo "$matches"
}

echo "test-repo-sync-policy: exclusions apply to repositories, not whole Ninjas"
echo

# Declared policy: exclude HyperFrames, while Anatomy remains syncable.
SB="$TMP_DIR/declared"
make_sandbox "$SB" "$SCRIPT_DIR/repos.md"
run_sync "$SB"

if [ "$(count_attempts "$SB" "$HYPERFRAMES")" -eq 0 ]; then
    pass "declared exclusion: HyperFrames is not cloned"
else
    fail "declared exclusion: HyperFrames clone was attempted"
fi

if [ "$(count_attempts "$SB" "$THREEJS")" -eq 0 ]; then
    pass "declared exclusion: Three.js pack is not cloned"
else
    fail "declared exclusion: Three.js pack clone was attempted"
fi

if [ "$(count_attempts "$SB" "$ANATOMY")" -eq 1 ]; then
    pass "Anatomy remains syncable for video-ninja"
else
    fail "Anatomy was not cloned for video-ninja"
fi

# Removing the markdown exclusion must not remove the hardcoded large-repo guard.
SB="$TMP_DIR/hardcoded"
awk '
    /^```no-sync-repos$/ { skip=1; next }
    skip && /^```$/ { skip=0; next }
    !skip { print }
' "$SCRIPT_DIR/repos.md" > "$TMP_DIR/repos-no-exclusions.md"
make_sandbox "$SB" "$TMP_DIR/repos-no-exclusions.md"
run_sync "$SB"

if [ "$(count_attempts "$SB" "$HYPERFRAMES")" -eq 0 ]; then
    pass "hardcoded guard: HyperFrames remains excluded without markdown block"
else
    fail "hardcoded guard failed: HyperFrames clone was attempted"
fi

if [ "$(count_attempts "$SB" "$THREEJS")" -eq 0 ]; then
    pass "hardcoded guard: Three.js pack remains excluded without markdown block"
else
    fail "hardcoded guard failed: Three.js pack clone was attempted"
fi

if [ "$(count_attempts "$SB" "$ANATOMY")" -eq 1 ]; then
    pass "removing the exclusion block does not block Anatomy"
else
    fail "Anatomy did not sync when no repository exclusion applied"
fi

echo
if [ "$FAILED" -eq 0 ]; then
    echo -e "\033[0;32mPASS\033[0m"
    exit 0
else
    echo -e "\033[0;31mFAIL\033[0m"
    exit 1
fi
