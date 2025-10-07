# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ================
# Local (e.g. company-specific)
# ================
# These are settings that shouldn't be committed to public dotfiles
source ~/.zshrc_local

# ================
# Settings
# ================
# Set default editor (e.g. used to write git commit messages):
export VISUAL=vim
export editor="$VISUAL"

# ================
# Aliases
# ================
alias ll="ls -lah"
alias prune-local="git fetch -p && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias n="nvim"

# Autocomplete with case insensitivity
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# ================
# Themes
# ================
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# ================
# Plugins
# ================
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source Zsh-sytax-highlighting must be last thing in zshrc file
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Function to clean up local git branches that have no corresponding remote branch
git_delete_local_branches() {
  # Fetch the latest updates from the remote
  git fetch --prune

  # List local branches and filter based on their presence in remotes
  for branch in $(git branch --format='%(refname:short)'); do
    # Check if the branch exists on the remote
    if [ "$branch" != "main" ] && [ "$branch" != "master" ]; then
      if ! git show-ref --verify --quiet refs/remotes/origin/"$branch"; then
        # If not, it means the branch was deleted in the remote, so we delete locally
        echo "Deleting local branch: $branch"
        git branch -d "$branch"
      fi
    fi
  done
}
alias delete-branches='git_delete_local_branches'
