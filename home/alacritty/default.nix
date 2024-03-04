{ config, pkgs, ...}:
{
  programs.alacritty = {
    enable = true;

    settings = {
      shell.program = "zsh";

      font = rec {
        normal.family = "UbuntuMono Nerd Font";
        size = 11;
        bold = { style = "Bold"; };
      };

      window.padding = {
        x = 5;
        y = 5;
      };

      key_bindings = [
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
