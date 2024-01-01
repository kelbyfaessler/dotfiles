# dotfiles

To install on new machine:
```
git clone https://github.com/KelbyFaessler/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

Then, install other software with platform-specific install scripts e.g. 
- fedora: `./install_fedora`
- debian/ubuntu: `./install_debian`

Neovim Config:
- FOR UPDATING NVIM VERSIONS, SEE `nvim-basic-ide`
- My neovim config used to be based on this repo (https://github.com/LunarVim/Neovim-from-scratch) which also has a corresponding youtube video series (https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
- That neovim config then evolved into this repo (https://github.com/LunarVim/nvim-basic-ide) which is now the basis for my neovim config
- And that repo is now called launch.nvim (https://github.com/LunarVim/Launch.nvim)
- Customizations I've made to that:
    - Add hop plugin
    - Add telescope media files plugin
    - Use floaterm with lazygit instead of toggleterm
    - Remove friendly snippets plugin
    - Remove indent-blankline plugin (visually highlight indentation level)
- TODO: Things I may want to add later:
    - customize lualine (add filepath)
    - try leap plugin (which may not conflict with existing hop keymaps since it uses 's' which I don't use normally)
    - show prior projects by default on start page
    - add keybind for :Telescope projects
    - fzf implmentation in c (faster): https://github.com/nvim-telescope/telescope-fzf-native.nvim
    - treesitter customization in kickstart.nvim
    - try some custom start page themes from https://github.com/goolord/alpha-nvim/discussions/16

Poetry setup on linux:
- Have installed poetry previously using they're official install script via curl. Pipx is an alternative to try and see if it handles pyenv better.
- I like to configure poetry to install dependencies in a venv in each project locally. To configure this:
    - `ll ~/.config/pypoetry` this probably won't exist initially
    - `poetry config --list` (virtualenvs.in-project probably false)
    - `poetry config virtualenvs.in-project true`
    - `poetry config --list` (virtualenvs.in-project should be true)

Reasons I picked `fnm` for node version manager:
- It's faster than nvm (2x to 40x) and nvm is bash based/a bash alias
- It's written in rust, hence speed but also correctness
- It tries to provide same features as nvm
- It's a binary exec so can easily run in CI systems
- Cross platform (windows too) and integrates with other shells (e.g. fish)
- fnm supports more platforms than `n`
- fnm supports .nvmrc and .node-version files while `volta` currently doesn't
- `volta` seems to try to do more than simply node version and is more complicated than fnm
- Potential replacement for `fnm` in future: `pnpm`

Additional Fedora manual setup:
- Go into display settings and turn on night light for blue light filter
- The fedora install script sets up imwheel for faster mouse scrolling. That was based on this link: http://www.webupd8.org/2015/12/how-to-change-mouse-scroll-wheel-speed.html
- Settings->Multitasking->Hot Corner->disable
- Settings->Keyboard->Keyboard Shortcuts->Switch Windows->Alt + Tab
- Settings->Keyboard->View and Customize Shortcuts->Switch Applications->Super + Tab
- To install postman: Software App->Postman (install flatpak version, which is easiest/most native of postman's offered installation methods)
- To enable fractional scaling: `gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']`
- To enable tap-to-click on touchpad: `gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true`
- For intel 12th gen CPU, to remove conflict with ambient light sensor and enable backlight brightness buttons: `sudo grubby --update-kernel=ALL --args="module_blacklist=hid_sensor_hub"`

NOTES:
- In windows, for the Powerlevel10k zsh theme, you'll have to manually install Meslo Nerd Font (see https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- In fedora, the above font also needs to be installed for gnome terminal to use my nvim icons. This font will be installed automatically in ~/.local/share/fonts by the install script
