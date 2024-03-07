{ config, pkgs, ... }:
{
  programs.browserpass.enable = true;

  environment.systemPackages = with pkgs; [
    brave
    firefox
    librewolf
  ];
}
