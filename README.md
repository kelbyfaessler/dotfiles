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
- My neovim config is based on this repo (https://github.com/LunarVim/Neovim-from-scratch) which also has a corresponding youtube video series (https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
- That neovim config then evolved into this repo (https://github.com/LunarVim/nvim-basic-ide)

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
