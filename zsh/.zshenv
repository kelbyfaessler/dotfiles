# Read by every zsh: interactive, login, and the non-interactive `zsh -c` that
# sshd uses for remote commands and that tools spawn for subprocesses. PATH
# belongs here rather than in .zshrc so `ssh host cfc-local status` and agent
# tool calls find user-installed tools without an interactive shell.
# Ubuntu adds ~/.local/bin only through ~/.profile, which zsh does not read.
path_prepend() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="$1:$PATH" ;;
  esac
}

# User-installed tools: uv, uvx, cfc-local, pre-commit, ruff.
path_prepend "$HOME/.local/bin"
# opencode
path_prepend "$HOME/.opencode/bin"

unset -f path_prepend
