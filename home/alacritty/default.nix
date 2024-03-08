{ config, pkgs, ...}:
let
  gruvboxLight = {
    primary = {
      background = "0xfbf1c7";
      foreground = "0x3c3836";
    };

    normal = {
      black = "0xfbf1c7";
      red = "0xcc241d";
      green = "0x98971a";
      yellow = "0xd79921";
      blue = "0x458588";
      magenta = "0xb16286";
      cyan = "0x689d6a";
      white = "0x7c6f64";
    };

    bright = {
      black = "0x928374";
      red = "0x9d0006";
      green = "0x79740e";
      yellow = "0xb57614";
      blue = "0x076678";
      magenta = "0x8f3f71";
      cyan = "0x427b58";
      white = "0x3c3836";
    };
  };

  gruvboxDark = {
    primary = {
      background = "0x282828";
      foreground = "0xebdbb2";
    };

    normal = {
      black = "0x282828";
      red = "0xcc241d";
      green = "0x98971a";
      yellow = "0xd79921";
      blue = "0x458588";
      magenta = "0xb16286";
      cyan = "0x689d6a";
      white = "0xa89984";
    };

    bright = {
      black = "0x928374";
      red = "0xfb4934";
      green = "0xb8bb26";
      yellow = "0xfabd2f";
      blue = "0x83a598";
      magenta = "0xd3869b";
      cyan = "0x8ec07c";
      white = "0xebdbb2";
    };
  };
in
{
  programs.alacritty = {
    enable = true;

    settings = {
      shell.program = "zsh";

      colors = gruvboxDark;

      font = rec {
        normal.family = "JetBrainsMono NFM Medium";
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
