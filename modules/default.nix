{ config, pkgs, ...}:
{
  imports = [
    ./xorg.nix
    ./virtualisation.nix
    ./bootloader.nix
    ./locale.nix
    ./sound.nix
  ];
}
