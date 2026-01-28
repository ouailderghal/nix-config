{ config, pkgs, ...}:
let
  myFont = "Hack Nerd Font Mono";

  themeXterm = {
    primary = {
      background = "#000000";
      foreground = "#ffffff";
    };

    normal = {
      black = "#000000";
      red = "#cd0000";
      green = "#00cd00";
      yellow = "#cdcd00";
      blue = "#0000ee";
      magenta = "#cd00cd";
      cyan = "#00cdcd";
      white = "#e5e5e5";
    };

    bright = {
      black = "#7f7f7f";
      red = "#ff0000";
      green = "#00ff00";
      yellow = "#ffff00";
      blue = "#5c5cff";
      magenta = "#ff00ff";
      cyan = "#00ffff";
      white = "#ffffff";
    };
  };

  themeHyper = {
    primary = {
      background = "#000000";
      foreground = "#ffffff";
    };
    cursor = {
      text = "#F81CE5";
      cursor = "#ffffff";
    };
    normal = {
      black = "#000000";
      red = "#fe0100";
      green = "#33ff00";
      yellow = "#feff00";
      blue = "#0066ff";
      magenta = "#cc00ff";
      cyan = "#00ffff";
      white = "#d0d0d0";
    };
    bright = {
      black = "#808080";
      red = "#fe0100";
      green = "#33ff00";
      yellow = "#feff00";
      blue = "#0066ff";
      magenta = "#cc00ff";
      cyan = "#00ffff";
      white = "#FFFFFF";
    };
  };
in
{
  programs.alacritty = {
    enable = true;

    settings = {
      terminal.shell= "bash";
      colors = themeHyper;

      font = rec {
        normal.family = myFont;
        size = 11;
        bold = { style = "Medium"; };
      };

      window.padding = {
        x = 5;
        y = 5;
      };

      keyboard.bindings = [
        {
          key = "K";
          mods = "Control|Shift";
          action = "IncreaseFontSize";
        }
        {
          key = "J";
          mods = "Control|Shift";
          action = "DecreaseFontSize";
        }
        {
          key = "Back";
          mods = "Control|Shift";
          action = "ResetFontSize";
        }
        {
          key = "K";
          mods = "Alt";
          action = "ScrollPageUp";
        }
        {
          key = "J";
          mods = "Alt";
          action = "ScrollPageDown";
        }
      ];
    };
  };
}
