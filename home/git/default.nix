{ config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "Ouail Derghal";
    userEmail = "ouailderghal1@gmail.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      merge = {
        tool = "${pkgs.meld}/bin/meld";
      };
    };

    includes = [
      {
        contents = {
          user = {
            email = "ouail.derghal@imt-atlantique.fr";
          };
        };

        condition = "gitdir:~/Projects/imt/";
      }
    ];
  
  };
}
