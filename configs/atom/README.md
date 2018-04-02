Installs packages & configurations for [Atom Editor](https://atom.io)

## Packages
> If you don't have apm, install the [Atom CLI tools](https://flight-manual.atom.io/getting-started/sections/installing-atom/) from the menubar menu in Atom.app

1. Install package file with apm:
  ```console
  apm install --packages-file ./atom_packages.txt
  ```
2. Restart Atom.app

## Atom Home
- Add `export ATOM_HOME="$HOME/.atom/"` to your profile or sources file to have $ATOM_HOME available in the shell
