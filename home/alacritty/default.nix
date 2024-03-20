{ config, pkgs, ...}:
let
  theme = {
    primary = {
      background = "0x1e1e1e";
      foreground = "0xffffff";
    };

    normal = {
      black = "0x171421";
      red = "0xc01c28";
      green = "0x26a269";
      yellow = "0xa2734c";
      blue = "0x12488b";
      magenta = "0xa347ba";
      cyan = "0x2aa1b3";
      white = "0xd0cfcc";
    };

    bright = {
      black = "0x535c64";
      red = "0xf66151";
      green = "0x33d17a";
      yellow = "0xe9ad0c";
      blue = "0x2a7bde";
      magenta = "0xc061cb";
      cyan = "0x33c7de";
      white = "0xffffff";
    };
  };
in
{
  programs.alacritty = {
    enable = true;

    settings = {
      shell.program = "zsh";

      colors = theme;

      font = rec {
        normal.family = "UbuntuMono Nerd Font";
        size = 9;
        bold = { style = "Medium"; };
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
