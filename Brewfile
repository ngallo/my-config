# Brewfile — declarative macOS package list.
# Apply with: brew bundle --file=~/Brewfile
# (chezmoi will also auto-apply via run_onchange_after_30-brew-bundle.sh.tmpl)

# ─── Core CLI ─────────────────────────────────────────────────────────────
brew "bash"
brew "zsh"
brew "coreutils"
brew "findutils"
brew "gnu-sed"
brew "gawk"
brew "grep"

# ─── Modern replacements ──────────────────────────────────────────────────
brew "starship"          # prompt
brew "zoxide"            # cd → smarter cd
brew "atuin"             # history → searchable shell history db
brew "fzf"               # fuzzy finder
brew "ripgrep"           # grep
brew "fd"                # find
brew "bat"               # cat with syntax highlight
brew "eza"               # ls
brew "delta"             # git pager
brew "jq"                # json
brew "yq"                # yaml
brew "htop"
brew "btop"              # nicer htop
brew "tldr"              # man pages, the human version
brew "dust"              # du → visual
brew "duf"               # df → visual
brew "procs"             # ps → modern
brew "sd"                # sed → simpler
brew "hyperfine"         # CLI benchmarking
brew "tokei"             # count LOC fast
brew "watchexec"         # run command on file change

# ─── Dev ──────────────────────────────────────────────────────────────────
brew "git"
brew "git-lfs"
brew "git-delta"         # already pulled by delta above, keep as explicit dep
brew "gh"                # GitHub CLI
brew "glab"              # GitLab CLI
brew "lazygit"           # TUI for git
brew "lazydocker"        # TUI for docker
brew "neovim"
brew "mise"              # runtime manager
brew "direnv"            # per-dir env
brew "just"              # command runner
brew "chezmoi"           # dotfile manager (self-referential, ok)
brew "pre-commit"
brew "shellcheck"
brew "shfmt"
brew "prettier"
brew "stylua"            # Lua formatter (for nvim configs)
brew "tree-sitter"

# ─── Languages (mise will manage versions; these are baseline tooling) ───
# brew "go"
brew "rustup-init"

# ─── Containers / cloud ───────────────────────────────────────────────────
# Docker daemon comes from Docker Desktop (installed separately, GUI app);
# only the CLI tools are brewed.
# brew "docker"
# brew "docker-compose"
brew "kubectl"
brew "k9s"
brew "helm"
brew "awscli"

# ─── Security / secrets ───────────────────────────────────────────────────
brew "gnupg"
brew "age"
brew "ssh-copy-id"
brew "bitwarden-cli"     # `bw` — used by chezmoi `{{ bitwarden ... }}` templates
# keepassxc-cli is shipped inside the `keepassxc` cask below (KeePassXC.app/Contents/MacOS/keepassxc-cli)

# ─── Casks (GUI apps) ─────────────────────────────────────────────────────
cask "ghostty"                       # terminal
cask "visual-studio-code"
cask "rectangle"                     # window manager
# cask "docker"                      # Docker Desktop — install manually
cask "raycast"
cask "keepassxc"                     # password manager (offline DB)
cask "bitwarden"                     # password manager (cloud)
cask "font-jetbrains-mono-nerd-font"
