{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    telegram-desktop
    signal-desktop
    hexchat
  ];
}
