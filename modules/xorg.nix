{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;

    layout = "fr";
    xkbVariant = "latin9";

    # Enable LightDM display manager.
    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+i3";
    };

    # Enable XFCE desktop.
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };

    # Enable touchpad support.
    libinput = {
      enable = true;
      touchpad.disableWhileTyping = true;
    };

    # Enable i3 window manager and install additional packages.
    windowManager.i3 = {
      enable = true;

      extraPackages = with pkgs; [
        xclip
        dmenu
        i3lock
        i3blocks
        pavucontrol
        arandr
        copyq
        nitrogen
        rofi
        lxappearance
        scrot
        xarchiver
     ];
    };
  };
}
