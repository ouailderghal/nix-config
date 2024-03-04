{ config, pkgs, ...}:
let
  neovimConfig = builtins.fetchGit {
      url = "https://github.com/ouailderghal/nvim.git";
      rev = "d32ca7807eaf4da870a0bdecf4dfd94f2ccad09a";
  };
in 
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    withNodeJs = true;
    withRuby = true;
  };
  
  xdg.configFile.nvim = {
    source = neovimConfig;
    recursive = true;
  };
}
