{ config, pkgs, ... }:
{
  networking = {
    hostName = "tokyo";
    networkmanager.enable = true;
  };
}
