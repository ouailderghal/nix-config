{ config, pkgs, ...}:
let
  username = "ouail";
in 
{
   virtualisation.virtualbox.host.enable = true;
   virtualisation.docker.enable = true;

   users.extraGroups = {
      vboxusers.members = [ username ];
      docker.members = [ username ];
   };
}
