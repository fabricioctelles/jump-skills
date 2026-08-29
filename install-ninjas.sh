#!/bin/bash
# install-ninjas.sh
# Install Jump Skills (ninjas) to AI agents
#
# Usage:
#   ./install-ninjas.sh                    # Install all ninjas
#   ./install-ninjas.sh aws-ninja          # Install specific ninja
#   ./install-ninjas.sh --list             # List available agents
#   ./install-ninjas.sh --status           # Show what's installed

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NINJAS_DIR="$SCRIPT_DIR/ninjas"

cd "$SCRIPT_DIR"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Agent configurations: agent_id|global_path
declare -a AGENTS=(
    "claude-code|~/.claude/skills"
    "kiro-cli|~/.kiro/skills"
    "cursor|~/.cursor/skills"
    "codex|~/.codex/skills"
    "opencode|~/.config/opencode/skills"
    "windsurf|~/.codeium/windsurf/skills"
    "github-copilot|~/.copilot/skills"
    "gemini-cli|~/.gemini/skills"
    "antigravity|~/.gemini/antigravity/skills"
    "cline|~/.agents/skills"
    "roo|~/.roo/skills"
    "amp|~/.config/agents/skills"
    "openclaw|~/.openclaw/skills"
    "continue|~/.continue/skills"
    "goose|~/.config/goose/skills"
    "pi|~/.pi/agent/skills"
    "junie|~/.junie/skills"
    "trae|~/.trae/skills"
    "qoder|~/.qoder/skills"
    "qwen-code|~/.qwen/skills"
    "zencoder|~/.zencoder/skills"
    "firebender|~/.firebender/skills"
    "cortex|~/.snowflake/cortex/skills"
    "openhands|~/.openhands/skills"
    "devin|~/.config/devin/skills"
    "tabnine-cli|~/.tabnine/agent/skills"
    "kilo|~/.kilocode/skills"
    "augment|~/.augment/skills"
    "bob|~/.bob/skills"
    "lingma|~/.lingma/skills"
    "minimax-code|~/.minimax/skills"
    "mistral-vibe|~/.vibe/skills"
    "grok|~/.grok/skills"
    "droid|~/.factory/skills"
    "forge|~/.forge/skills"
    "neovate|~/.neovate/skills"
    "pochi|~/.pochi/skills"
)

# Expand ~ in paths
expand_path() {
    echo "${1/#\~/$HOME}"
}

# List available ninjas
list_ninjas() {
    if [[ ! -d "$NINJAS_DIR" ]]; then
        echo -e "${YELLOW}No ninjas directory found${NC}"
        return
    fi
    
    for ninja_dir in "$NINJAS_DIR"/*/; do
        if [[ -f "$ninja_dir/SKILL.md" ]]; then
            basename "$ninja_dir"
        fi
    done
}

# Install a ninja to all detected agents
install_ninja() {
    local ninja="$1"
    local method="${2:-copy}"  # copy or symlink
    local ninja_source="$NINJAS_DIR/$ninja"
    local installed=0
    
    if [[ ! -d "$ninja_source" ]]; then
        echo -e "  ${RED}Error: $ninja not found in $NINJAS_DIR${NC}"
        return 1
    fi
    
    if [[ ! -f "$ninja_source/SKILL.md" ]]; then
        echo -e "  ${RED}Error: $ninja_source/SKILL.md not found${NC}"
        return 1
    fi
    
    for agent_config in "${AGENTS[@]}"; do
        IFS='|' read -r agent_id global_path <<< "$agent_config"
        local expanded=$(expand_path "$global_path")
        local parent_dir=$(dirname "$expanded")
        
        # Check if agent is installed (parent dir exists)
        if [[ ! -d "$parent_dir" ]] && [[ ! -d "$expanded" ]]; then
            continue
        fi
        
        local target="$expanded/$ninja"
        mkdir -p "$expanded"
        
        # Remove existing
        [[ -L "$target" ]] && rm -f "$target"
        [[ -d "$target" ]] && rm -rf "$target"
        
        if [[ "$method" == "symlink" ]]; then
            ln -s "$ninja_source" "$target"
        else
            # Copy and substitute placeholders
            mkdir -p "$target"
            for file in "$ninja_source"/*; do
                if [[ -f "$file" ]]; then
                    local filename=$(basename "$file")
                    # Replace {{JUMP_SKILLS_DIR}} with actual path
                    sed "s|{{JUMP_SKILLS_DIR}}|$SCRIPT_DIR|g" "$file" > "$target/$filename"
                elif [[ -d "$file" ]]; then
                    cp -r "$file" "$target/"
                fi
            done
        fi
        ((installed++)) || true
    done
    
    echo -e "  ${GREEN}✓${NC} Installed to $installed agents"
}

# List agents
list_agents() {
    echo -e "${BLUE}Supported AI Coding Agents${NC}"
    echo "==========================="
    printf "%-20s %-45s %s\n" "Agent" "Global Path" "Status"
    printf "%-20s %-45s %s\n" "-----" "-----------" "------"
    
    for agent_config in "${AGENTS[@]}"; do
        IFS='|' read -r agent_id global_path <<< "$agent_config"
        local expanded=$(expand_path "$global_path")
        local status=""
        if [[ -d "$expanded" ]] || [[ -d "$(dirname $expanded)" ]]; then
            status="${GREEN}[detected]${NC}"
        fi
        printf "%-20s %-45s %b\n" "$agent_id" "$global_path" "$status"
    done
}

# Show installation status
show_status() {
    echo -e "${BLUE}Jump Skills Installation Status${NC}"
    echo "================================"
    echo ""
    
    local ninjas=($(list_ninjas))
    
    if [[ ${#ninjas[@]} -eq 0 ]]; then
        echo -e "${YELLOW}No ninjas found in $NINJAS_DIR${NC}"
        return
    fi
    
    for ninja in "${ninjas[@]}"; do
        echo -e "${CYAN}[$ninja]${NC}"
        
        for agent_config in "${AGENTS[@]}"; do
            IFS='|' read -r agent_id global_path <<< "$agent_config"
            local expanded=$(expand_path "$global_path")
            local target="$expanded/$ninja"
            
            if [[ -d "$target" ]] || [[ -L "$target" ]]; then
                local link_info=""
                [[ -L "$target" ]] && link_info=" (symlink)"
                echo -e "  ${GREEN}✓${NC} $agent_id$link_info"
            fi
        done
        echo ""
    done
}

# Main
main() {
    local target_ninja=""
    local method="copy"
    
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --symlink)
                method="symlink"
                shift
                ;;
            --list|-l)
                list_agents
                exit 0
                ;;
            --status|-s)
                show_status
                exit 0
                ;;
            --help|-h)
                echo "Usage: $0 [options] [ninja-name]"
                echo ""
                echo "Options:"
                echo "  (none)          Install all ninjas from ninjas/"
                echo "  [ninja-name]    Install specific ninja"
                echo "  --symlink       Symlink instead of copy"
                echo "  --status, -s    Show installation status"
                echo "  --list, -l      List supported agents"
                echo "  --help, -h      Show this help"
                echo ""
                echo "Ninjas are Jump Skills stored in: $NINJAS_DIR/"
                echo "Create a ninja by adding <name>/SKILL.md in that directory."
                exit 0
                ;;
            -*)
                echo -e "${RED}Unknown option: $1${NC}"
                exit 1
                ;;
            *)
                target_ninja="$1"
                shift
                ;;
        esac
    done
    
    echo -e "${BLUE}Jump Skills Installer${NC}"
    echo "====================="
    echo -e "Source: ${YELLOW}$NINJAS_DIR${NC}"
    echo ""
    
    local ninjas_to_install=()
    
    if [[ -n "$target_ninja" ]]; then
        ninjas_to_install+=("$target_ninja")
    else
        while IFS= read -r ninja; do
            [[ -n "$ninja" ]] && ninjas_to_install+=("$ninja")
        done < <(list_ninjas)
    fi
    
    if [[ ${#ninjas_to_install[@]} -eq 0 ]]; then
        echo -e "${YELLOW}No ninjas found to install.${NC}"
        echo "Create a ninja by adding <name>/SKILL.md in $NINJAS_DIR/"
        exit 0
    fi
    
    for ninja in "${ninjas_to_install[@]}"; do
        echo -e "${CYAN}[$ninja]${NC}"
        install_ninja "$ninja" "$method"
    done
    
    echo ""
    echo -e "${GREEN}Done!${NC}"
}

main "$@"
