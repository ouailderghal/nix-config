{ config,  lib, ...}:
{
  programs.i3status = {
    enable = true;  
    enableDefault = false;

    modules = {
      "ethernet _first_" = {
        position = 1;

        settings = {
          format_up = "E: %ip (%speed)";
          format_down = "E: down";
        };
      };

      "wireless _first_" = {
        position = 2;

        settings = {
          format_up = "W: (%quality at %essid)";
          format_down = "W: down";
        };
      };

      "battery 1" = {
        position = 3;
        settings = {
          format = "%status %percentage %remaining";
          path = "/sys/class/power_supply/BAT0/uevent";
        };
      };

      "tztime local" = {
        position = 4;
        settings.format = "%d/%m/%Y %H:%M:%S";
      };
    };
  };
}
