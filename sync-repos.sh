#!/bin/bash
# sync-repos.sh
# Clone or update all repositories from repos.md and populate .agents/skills/
#
# Usage:
#   ./sync-repos.sh                    # Sync all repos for all ninjas
#   ./sync-repos.sh aws-ninja          # Sync repos for specific ninja
#   ./sync-repos.sh --status           # Show status of all repos
#   ./sync-repos.sh --list             # List repos by ninja

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPOS_FILE="$SCRIPT_DIR/repos.md"
REPOS_DIR="$SCRIPT_DIR/repos"
SKILLS_MAP_FILE="$SCRIPT_DIR/.skills-map"

cd "$SCRIPT_DIR"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Parse ninjas from ninjas.md
parse_ninjas() {
    local ninjas_file="$SCRIPT_DIR/ninjas.md"
    if [[ ! -f "$ninjas_file" ]]; then
        echo -e "${RED}Error: ninjas.md not found${NC}" >&2
        exit 1
    fi
    sed -n '/^```ninjas$/,/^```$/p' "$ninjas_file" | grep -v '^```' | grep -v '^$' || true
}

# Parse repos for a specific ninja from repos.md
parse_repos_for_ninja() {
    local ninja="$1"
    if [[ ! -f "$REPOS_FILE" ]]; then
        echo -e "${RED}Error: repos.md not found${NC}" >&2
        exit 1
    fi
    
    # Find section [ninja] and extract URLs from next ```repos block
    awk -v ninja="$ninja" '
        $0 ~ "^## \\[" ninja "\\]" { in_section=1; next }
        /^## \[/ && in_section { in_section=0 }
        in_section && /^```repos$/ { in_block=1; next }
        in_section && in_block && /^```$/ { in_block=0; next }
        in_section && in_block && /^https:\/\// { print }
    ' "$REPOS_FILE"
}

# Get repo name from URL
get_repo_name() {
    basename "$1"
}

# Clone a single repo (removes .git to avoid IDE confusion)
clone_repo() {
    local url="$1"
    local ninja="$2"
    local name=$(get_repo_name "$url")
    local target_dir="$REPOS_DIR/$ninja"
    
    mkdir -p "$target_dir"
    
    echo -e "  ${BLUE}Cloning $name...${NC}"
    if gh repo clone "$url" "$target_dir/$name" -- --depth=1 2>/dev/null; then
        rm -rf "$target_dir/$name/.git"
        echo -e "    ${GREEN}✓${NC} Cloned successfully"
        return 0
    elif git clone --depth=1 "$url" "$target_dir/$name" 2>/dev/null; then
        rm -rf "$target_dir/$name/.git"
        echo -e "    ${GREEN}✓${NC} Cloned successfully (via git)"
        return 0
    else
        echo -e "    ${RED}✗${NC} Failed to clone"
        return 1
    fi
}

# Re-clone a repo (used when directory exists but no .git)
reclone_repo() {
    local url="$1"
    local ninja="$2"
    local name=$(get_repo_name "$url")
    local target_dir="$REPOS_DIR/$ninja"
    
    echo -e "  ${BLUE}Updating $name...${NC}"
    rm -rf "$target_dir/$name"
    
    if gh repo clone "$url" "$target_dir/$name" -- --depth=1 2>/dev/null; then
        rm -rf "$target_dir/$name/.git"
        echo -e "    ${GREEN}✓${NC} Updated (re-cloned)"
        return 0
    elif git clone --depth=1 "$url" "$target_dir/$name" 2>/dev/null; then
        rm -rf "$target_dir/$name/.git"
        echo -e "    ${GREEN}✓${NC} Updated (re-cloned via git)"
        return 0
    else
        echo -e "    ${RED}✗${NC} Failed to update"
        return 1
    fi
}

# Find skills in a repo and add to skills map
map_skills() {
    local repo_name="$1"
    local ninja="$2"
    local repo_path="$REPOS_DIR/$ninja/$repo_name"
    local count=0
    
    if [[ ! -d "$repo_path" ]]; then
        return
    fi
    
    # Find all SKILL.md files
    while IFS= read -r skill_file; do
        local skill_dir=$(dirname "$skill_file")
        local skill_name=$(basename "$skill_dir")
        local relative_path="${skill_dir#$SCRIPT_DIR/}"
        
        # Skip if it's a misc, evals, template, or test directory
        if [[ "$skill_dir" =~ (misc|evals|template|examples|tests|__pycache__|node_modules) ]]; then
            continue
        fi
        
        # Skip if skill name is generic (e.g., "skills", "core", "build")
        if [[ "$skill_name" =~ ^(skills|core|build|workflows|plugins|specialized-skills)$ ]]; then
            continue
        fi
        
        # Add to skills map: ninja|skill_name|relative_path
        echo "$ninja|$skill_name|$relative_path" >> "$SKILLS_MAP_FILE"
        ((count++)) || true
    done < <(find "$repo_path" -name "SKILL.md" -type f 2>/dev/null)
    
    if [[ $count -gt 0 ]]; then
        echo -e "    ${CYAN}→${NC} Mapped $count skills"
    fi
}

# Sync repos for a specific ninja
sync_ninja() {
    local ninja="$1"
    local cloned=0
    local updated=0
    local failed=0
    
    echo -e "\n${CYAN}[$ninja]${NC}"
    
    local repos=$(parse_repos_for_ninja "$ninja")
    if [[ -z "$repos" ]]; then
        echo -e "  ${YELLOW}No repos found for $ninja${NC}"
    else
        local ninja_repos_dir="$REPOS_DIR/$ninja"
        
        while IFS= read -r url; do
            [[ -z "$url" ]] && continue
            local name=$(get_repo_name "$url")
            
            if [[ -d "$ninja_repos_dir/$name" ]]; then
                if reclone_repo "$url" "$ninja"; then
                    ((updated++)) || true
                else
                    ((failed++)) || true
                fi
            else
                if clone_repo "$url" "$ninja"; then
                    ((cloned++)) || true
                else
                    ((failed++)) || true
                fi
            fi
            
            map_skills "$name" "$ninja"
        done <<< "$repos"
        
        echo -e "  ${GREEN}Done:${NC} cloned=$cloned updated=$updated failed=$failed"
    fi
}

# Show status
show_status() {
    echo -e "${BLUE}Jump Skills Repository Status${NC}"
    echo "=============================="
    echo -e "Repos:  ${YELLOW}$REPOS_DIR${NC}"
    echo -e "Map:    ${YELLOW}$SKILLS_MAP_FILE${NC}"
    echo ""
    
    for ninja in $(parse_ninjas); do
        echo -e "${CYAN}[$ninja]${NC}"
        local ninja_repos_dir="$REPOS_DIR/$ninja"
        
        for url in $(parse_repos_for_ninja "$ninja"); do
            local name=$(get_repo_name "$url")
            
            if [[ -d "$ninja_repos_dir/$name" ]]; then
                echo -e "  ${GREEN}✓${NC} $name"
            else
                echo -e "  ${RED}✗${NC} $name (not synced)"
            fi
        done
        echo ""
    done
    
    local skill_count=0
    [[ -f "$SKILLS_MAP_FILE" ]] && skill_count=$(wc -l < "$SKILLS_MAP_FILE" | tr -d ' ')
    echo -e "Total skills mapped: ${YELLOW}$skill_count${NC}"
}

# List repos by ninja
list_repos() {
    echo -e "${BLUE}Repositories by Ninja${NC}"
    echo "======================"
    
    for ninja in $(parse_ninjas); do
        echo -e "\n${CYAN}[$ninja]${NC}"
        
        for url in $(parse_repos_for_ninja "$ninja"); do
            local name=$(get_repo_name "$url")
            echo "  $name"
            echo "    $url"
        done
    done
}

# Main
main() {
    local target_ninja=""
    
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --status|-s)
                show_status
                exit 0
                ;;
            --list|-l)
                list_repos
                exit 0
                ;;
            --help|-h)
                echo "Usage: $0 [options] [ninja-name]"
                echo ""
                echo "Options:"
                echo "  (none)         Sync all repos for all ninjas"
                echo "  [ninja-name]   Sync repos for specific ninja only"
                echo "  --status, -s   Show status of all repositories"
                echo "  --list, -l     List repositories by ninja"
                echo "  --help, -h     Show this help"
                echo ""
                echo "Examples:"
                echo "  $0                  # Sync all"
                echo "  $0 aws-ninja        # Sync only AWS repos"
                echo "  $0 firecrawl-ninja  # Sync only Firecrawl repos"
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
    
    echo -e "${BLUE}Syncing Jump Skills Repositories${NC}"
    echo "================================="
    echo -e "Source: ${YELLOW}$REPOS_FILE${NC}"
    echo -e "Map:    ${YELLOW}$SKILLS_MAP_FILE${NC}"
    
    # Clear skills map before syncing
    if [[ -n "$target_ninja" ]]; then
        # Keep existing entries for other ninjas, clear only target
        if [[ -f "$SKILLS_MAP_FILE" ]]; then
            grep -v "^$target_ninja|" "$SKILLS_MAP_FILE" > "$SKILLS_MAP_FILE.tmp" 2>/dev/null || true
            mv "$SKILLS_MAP_FILE.tmp" "$SKILLS_MAP_FILE"
        fi
        sync_ninja "$target_ninja"
    else
        # Full sync - clear everything
        > "$SKILLS_MAP_FILE"
        for ninja in $(parse_ninjas); do
            sync_ninja "$ninja"
        done
    fi
    
    # Sort and dedupe the map
    sort -u -o "$SKILLS_MAP_FILE" "$SKILLS_MAP_FILE"
    
    echo ""
    echo -e "${GREEN}Sync complete!${NC}"
    
    local skill_count=$(wc -l < "$SKILLS_MAP_FILE" | tr -d ' ')
    echo -e "Total skills mapped: ${YELLOW}$skill_count${NC}"
    echo -e "Skills map: ${YELLOW}$SKILLS_MAP_FILE${NC}"
}

main "$@"
