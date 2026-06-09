#!/bin/bash

. scripts/utils.sh
. scripts/prerequisites.sh
. scripts/brew-install-custom.sh
. scripts/symlinks.sh

info "Dotfiles installation initialized..."
read -p "Install Homebrew dependencies? [y/n] " install_apps
read -p "Overwrite existing dotfiles? [y/n] " overwrite_dotfiles

if [[ "$install_apps" == "y" ]]; then
    printf "\n"
    info "===================="
    info "Prerequisites"
    info "===================="

    install_xcode
    install_homebrew

    printf "\n"
    info "===================="
    info "Homebrew Bundle"
    info "===================="

    run_brew_bundle
fi

printf "\n"
info "===================="
info "Terminal"
info "===================="

info "Adding .hushlogin file to suppress 'last login' message in terminal..."
touch "$HOME/.hushlogin"

printf "\n"
info "===================="
info "Symbolic Links"
info "===================="

chmod +x ./scripts/symlinks.sh
if [[ "$overwrite_dotfiles" == "y" ]]; then
    warning "Deleting existing dotfiles..."
    ./scripts/symlinks.sh --delete --include-files
fi
./scripts/symlinks.sh --create

success "Dotfiles set up successfully."
