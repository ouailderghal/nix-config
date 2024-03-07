{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./hostname.nix
  ];
}
