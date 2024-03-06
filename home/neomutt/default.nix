{ config, pkgs, ... }:
let
  config = builtins.fetchGit {
    url = "https://gitlab.com/ouailderghal1/neomutt.git";
    rev = "dc7c064bc3716e013c6376ab13d981c72623dc72";
  };
in 
{
  programs.neomutt.enable = true;

  xdg.configFile.neomutt = {
    source = config;
    recursive = true;
  };
}
