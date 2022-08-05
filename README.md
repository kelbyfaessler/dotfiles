# dotfiles

To install on new machine:
```
git clone https://github.com/KelbyFaessler/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

Then, install zsh if not already installed (can check with `zsh --version`).
For debian/ubuntu systems this can be done with `./install_debian`

Neovim Config:
- My neovim config is based on this repo (https://github.com/LunarVim/Neovim-from-scratch) which also has a corresponding youtube video series (https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
- That neovim config then evolved into this repo (https://github.com/LunarVim/nvim-basic-ide)

NOTES:
- In windows, for the Powerlevel10k zsh theme, you'll have to manually install Meslo Nerd Font (see https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- In fedora, the above font also needs to be installed for gnome terminal to use my nvim icons. This font will be installed automatically in ~/.local/share/fonts by the install script
