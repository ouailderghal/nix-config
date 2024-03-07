{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-any
    gimp
    inkscape
    mypaint
    simplescreenrecorder
    vlc
    papirus-icon-theme
  ];
}
