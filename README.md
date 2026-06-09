# Max's Dotfiles

Personal macOS development setup for Cursor, Warp, zsh, Starship, Claude Code, and a small set of command-line tools.

## What This Manages

- **Editor**: Cursor user settings and extension list.
- **Terminal**: Warp settings.
- **Shell**: zsh with Starship, fzf, zoxide, eza, bat, fd, ripgrep, lazygit, and yazi.
- **Prompt**: Starship using the Nord palette from the original repo.
- **AI coding**: Claude Code user settings.
- **Fonts**: Hack Nerd Font for terminal glyphs and Starship icons.

## Install

```bash
./install.sh
```

The installer can:

- install Homebrew dependencies from `homebrew/Brewfile`
- create `~/.hushlogin`
- symlink files listed in `symlinks.conf`

## Cursor Extensions

Cursor's CLI is not always installed by default. In Cursor, run:

```text
Shell Command: Install 'cursor' command in PATH
```

Then install the maintained extension set:

```bash
./scripts/cursor-extensions.sh
```

## Symlinks

Managed links are listed in `symlinks.conf`.

```bash
./scripts/symlinks.sh --create
./scripts/symlinks.sh --delete
```

Use `--delete --include-files` only when intentionally replacing existing local config files.
