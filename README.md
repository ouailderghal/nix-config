# Nix Config

My personal NixOS configuration, built as a flake.

## Dotfiles

This repo only manages the system (NixOS) side of things. There is no
home-manager. User-level dotfiles live in a separate repo,
[ouailderghal/dotfiles](https://github.com/ouailderghal/dotfiles), and are
applied with [GNU Stow](https://www.gnu.org/software/stow/); `stow` is installed
as a system package here.

## Usage

```sh
sudo nixos-rebuild switch --flake .#zeus
```

