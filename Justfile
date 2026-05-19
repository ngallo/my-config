# Justfile — common chezmoi operations. Run `just` to see the menu.
set shell := ["bash", "-uc"]

default:
    @just --list

# Apply pending changes
apply:
    chezmoi apply -v

# Preview pending changes
diff:
    chezmoi diff

# Edit a managed file (e.g. `just edit zshrc` or `just edit .config/git/config`)
edit FILE:
    chezmoi edit ~/.{{FILE}}

# Pull upstream + apply + brew bundle
update:
    chezmoi update -v
    @if [ "$(uname)" = "Darwin" ]; then brew bundle --file=~/Brewfile; fi

# Sanity check: templates parse, files apply cleanly
doctor:
    chezmoi doctor
    chezmoi verify
    @echo "✓ chezmoi healthy"

# Lint shell scripts in the repo
lint:
    @command -v shellcheck >/dev/null || { echo "install shellcheck"; exit 1; }
    @find . -type f \( -name '*.sh' -o -name '*.sh.tmpl' \) -print0 | \
        xargs -0 -I{} sh -c 'echo "▶ {}"; shellcheck -x "{}" || true'

# Render a single template (useful for debugging) — `just render dot_zshrc.tmpl`
render FILE:
    chezmoi execute-template < {{FILE}}

# Show currently resolved chezmoi data (the [data] from chezmoi.toml)
data:
    chezmoi data

# Run all CI checks locally
ci: lint doctor
    @echo "✓ CI checks passed"

# Opt-in deep cleanup — removes things the auto-cleanup wouldn't dare touch.
# Asks before each removal.
nuke-old:
    @echo "This will offer to remove DATA-bearing legacy installs."
    @echo "Each step asks for confirmation. Ctrl-C any time to bail."
    @echo
    @for path in \
        "$HOME/.nvm:NVM install (mise replaces it; you'll lose installed node versions)" \
        "$HOME/.vim/bundle:vim-plug plugin dir (we use lazy.nvim)" \
        "$HOME/.vim/spell:vim spell files" \
        "$HOME/.oh-my-zsh:oh-my-zsh install (chezmoi-managed zsh has plugins via .chezmoiexternal.toml)" \
        "$HOME/.zshrc.pre-oh-my-zsh:oh-my-zsh backup file" \
        "$HOME/.rbenv:rbenv install (mise replaces it)" \
        "$HOME/.pyenv:pyenv install (mise replaces it)" \
        ; do \
        p="$${path%%:*}"; reason="$${path#*:}"; \
        if [ -e "$$p" ]; then \
            read -r -p "Remove $$p ($$reason)? [y/N] " ans; \
            [ "$$ans" = "y" ] && rm -rf "$$p" && echo "  ✗ removed $$p" || echo "  → kept"; \
        fi; \
    done
    @echo "✓ done"
