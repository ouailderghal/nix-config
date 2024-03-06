{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;

    layout = "fr";
    xkbVariant = "latin9";

    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+i3";
    };

    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };

    windowManager.i3 = {
      enable = true;

      extraPackages = with pkgs; [
        dmenu
        i3lock
        i3blocks
        pavucontrol
        arandr
        copyq
        nitrogen
     ];
    };
  };
}
