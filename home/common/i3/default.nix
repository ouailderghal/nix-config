{ config, lib, pkgs, ... }:
let 
  mod = "Mod4";

  myFonts = {
    names = [ "JetBrainsMono Nerd Font Mono" ];
    style = "Regular";
    size = 10.0;
  };
  
  up = "k";
  down = "j";
  left = "h";
  right = "l";

  term = "${pkgs.alacritty}/bin/alacritty";
  fileManager = "${pkgs.pcmanfm}/bin/pcmanfm";
  browser = "${pkgs.brave}/bin/brave";
  browserIncognito = "${browser} --incognito";
  appfinder = "${pkgs.xfce.xfce4-appfinder}/bin/xfce4-appfinder";


in {
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      terminal = term;
      fonts = myFonts;

      startup = [
        {
          always = false;
          command = "${pkgs.networkmanagerapplet}/bin/nm-applet";
          notification = false;
        }
        {
          always = false;
          command = "${pkgs.copyq}/bin/copyq";
          notification = false;
        }
        {
          always = false;
          command = "${pkgs.xcompmgr}/bin/xcompmgr -c";
          notification = false;
        }
        {
          always = false;
          command = "${pkgs.xorg.xsetroot}/bin/xsetroot -solid \"#000000\"";
          notification = false;
        }
      ];

      assigns = {
        "1" = [
          { class = "^Brave-browser$"; }
        ];

        "3" = [
          { class = "^Zotero$"; }
          { class = "^org.jabref.gui.MainApplication$"; }
        ];

        "9" = [
          { class = "^thunderbird$"; }
        ];

        "10" = [
          { class = "^discord$"; }
          { class = "^TelegramDesktop$"; }
          { class = "^Hexchat$"; }
          { class = "^Signal$"; }
        ];
      };

      floating = {
        criteria = [
          { class = "^Pcmanfm$"; }
          { class = "^Thunar$"; }
          { class = "^Xfce4-appfinder$"; }
          { class = "^Pavucontrol$"; }
          { class = "^Lxappearance$"; }
          { class = "^Nitrogen$"; }
          { class = "^copyq$"; }
          { class = "^SimpleScreenRecorder$"; }
        ];
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";

        # Focus
        "${mod}+${left}" = "focus left";
        "${mod}+${down}" = "focus down";
        "${mod}+${up}" = "focus up";
        "${mod}+${right}" = "focus right";

        # Move
        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${down}" = "move down";
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${right}" = "move right";

        # Orientation
        "${mod}+n" = "split h";
        "${mod}+v" = "split v";

        # Switch between recent workspaces.
        "${mod}+Tab" = "workspace back_and_forth";

        # Scratchpad
        "${mod}+Shift+equal" = "move scratchpad";
        "${mod}+equal" = "scratchpad show";

        # Program bindings.
        "${mod}+b" =  "exec ${browser}";
        "${mod}+Shift+b" = "exec ${browserIncognito}";
        "${mod}+Shift+f" = "exec ${fileManager}";
        "${mod}+Shift+d" = "exec ${appfinder}";
        "${mod}+p" = "exec copyq toggle";
        "${mod}+y" = "exec scrot";
        "${mod}+Shift+y --release" =  "exec scrot -s";
        "${mod}+Control+l --release" = "exec i3lock -c 000000";
      };

      bars = [
        {
          position = "bottom";
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = myFonts;
        }
      ];
    };
  };
}
