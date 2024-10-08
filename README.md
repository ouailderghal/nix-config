# Nix Configuration

This repository contains my personal configuration files written in Nix. I've
recently switched to NixOS and I'm enjoying the reproducible builds it offers
while exploring and teaching myself the Nix build system. The majority of
configuration files in this repository originate from my dotfiles. The build
leverages the Flakes experimental feature to construct the NixOS system,
installing and configuring all necessary programs and tools.

## Project Structure

The project is structured as follows:

- **home:** This directory contains Nix modules for Home Manager.
- **hosts:** Here, you'll find configurations specific to each individual host.
- **modules:** This directory houses common/shared configuration files.

# Build the System #

In order to build the system and apply the defined configuration files, you can
use rebuild.sh script or run the following command: 

```shell
sudo nixos-rebuild switch --flake .
```

# List of Available Configurations

1.  alacritty (terminal emulator).
2.  git (code versioning).
3.  i3 (window manager).
4.  lf (terminal-based file manager).
5.  mbsync (IMAP client).
6.  msmtp (SMTP client).
7.  neomutt (terminal-based email reader).
8.  neovim (terminal-based text editor).
9.  shell (configuration for bash and zsh shells).
10. tmux (terminal multiplexer).

