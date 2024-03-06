{ config, pkgs, ...}:
{
  imports = [
    ./xorg.nix
    ./virtualisation.nix
    ./texlive.nix
  ];
}
