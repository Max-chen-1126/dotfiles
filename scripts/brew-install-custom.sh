#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. "$SCRIPT_DIR/utils.sh"

run_brew_bundle() {
    local brewfile="$SCRIPT_DIR/../homebrew/Brewfile"

    if [ ! -f "$brewfile" ]; then
        error "Brewfile not found: $brewfile"
        return 1
    fi

    local check_output
    check_output=$(brew bundle check --file="$brewfile" 2>&1)

    if echo "$check_output" | grep -q "The Brewfile's dependencies are satisfied."; then
        warning "The Brewfile's dependencies are already satisfied."
    else
        info "Satisfying missing dependencies with 'brew bundle install'..."
        brew bundle install --file="$brewfile"
    fi
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    if ! command -v brew >/dev/null 2>&1; then
        error "Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi

    run_brew_bundle
fi
