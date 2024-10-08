{ config, pkgs, ...}:
{
  imports = [
    ./xorg.nix
    ./virtualisation.nix
    ./bootloader.nix
    ./locale.nix
    ./sound.nix
    ./browser.nix
    ./utils.nix
    ./agent.nix
    ./user.nix
    ./dev.nix
    ./cli.nix
    ./networking.nix
    ./communication.nix
    ./fonts.nix
    ./research.nix
  ];
}
