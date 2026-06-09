#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. "$SCRIPT_DIR/utils.sh"

install_cursor_extensions() {
    local editor_cli="${EDITOR_CLI:-cursor}"

    if ! command -v "$editor_cli" >/dev/null 2>&1; then
        error "Cursor CLI not found. In Cursor, run: Shell Command: Install 'cursor' command in PATH"
        exit 1
    fi

    info "Installing Cursor extensions with '$editor_cli'..."

    extensions=(
        zhuangtongfa.Material-theme
        ms-python.python
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        ms-azuretools.vscode-docker
        redhat.vscode-yaml
        eamodio.gitlens
        esbenp.prettier-vscode
    )

    for extension in "${extensions[@]}"; do
        "$editor_cli" --install-extension "$extension"
    done

    success "Cursor extensions installed successfully"
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    install_cursor_extensions
fi
