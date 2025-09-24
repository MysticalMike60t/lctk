# Linux Configuration Toolkit (LCTK)

## Install

1. `install_online_onescript.sh`
2. `git clone https://github.com/MysticalMike60t/lctk.git && cd lctk && sudo bash ./install.sh`
3. Manually place cloned files (or files from the .tar.xz archives on the release page) in a directory, and make a Symlink for `start.sh` in `/usr/local/bin` (preferrable Symlink name is: `lctk-start`)

### Optional Files

Never needs to be included with download (downloads program without other files)
- `install_online_onescript.sh`

Used to install (depends on local files)
- `install.sh`
- `uninstall.sh`
- `install_scripts/` folder

Any files beginning with `_dev__`