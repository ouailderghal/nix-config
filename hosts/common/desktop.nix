{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        xorg.xkill
        xclip
        dmenu
        i3lock
        i3blocks
        pavucontrol
        arandr
        autorandr
        copyq
        rofi
        lxappearance
        scrot
        xarchiver
      ];
    };
  };

  services.udev.extraRules = ''
    ACTION=="change", SUBSYSTEM=="drm", RUN+="${pkgs.autorandr}/bin/autorandr --change"
  '';

  services.libinput.touchpad.tapping = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.displayManager.defaultSession = "none+i3";

  security.pam.services = {
    i3lock.enable = true;
  };

}
