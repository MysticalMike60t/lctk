# Linux Configuration Toolkit (LCTK)

## Install

There are 3 ways to install LCTK:

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

## Usage

### Start

```bash
lctk-start
```

### Update

```bash
lctk-update
```

### Uninstall

```bash
sudo bash /usr/local/bin/lctk/uninstall.sh
```

#### Custom Installations

__Replace `/usr/local/bin/lctk/` with the path to the folder you installed it to.__

```bash
sudo bash /usr/local/bin/lctk/uninstall.sh
```

### Checking Version

Returns version and exits

```bash
lctk-start version
```

Always has version displayed at the top, and also runs the program (obviously since it is the start command)

```bash
lctk-start
```

## Errors

### Line endings

Download and Run `dos2unix` script inside the program folder to fix line ending issues.

#### One-Liner

Run this one-liner to fix it

```bash
curl -L -o "/usr/local/bin/lctk/_dev__dos2unix.sh" "https://raw.githubusercontent.com/MysticalMike60t/lctk/refs/heads/main/_dev__dos2unix.sh" && cd /usr/local/bin/lctk && sudo bash ./_dev__dos2unix.sh
```