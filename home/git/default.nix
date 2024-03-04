{ config, pkgs, ...}:
{
  programs.git = {
    enable = true;

    userName = "Ouail Derghal";
    userEmail = "ouailderghal1@gmail.com";

    signing = {
      key = "C9557C30943B96D2C27F18E61F8E47CECB0E0E16";
      signByDefault = true;
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      merge = {
        tool = "meld";
      };

      diff = {
        tool = "nvimdiff";
      };
    };

    includes = [
      {
        contents = {
          user = {
            name = "Ouail Derghal";
            email = "ouail.derghal@imt-atlantique.fr";
            signingKey = "2E3EB06AF98BB2D7B2533322251152B212939FA3";
          };
        };

        condition = "gitdir:~/Projects/imt/";
      }
    ];
  };
}
