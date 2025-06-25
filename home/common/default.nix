{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  home = {
    username = "ouail";
    homeDirectory = "/home/ouail";
    stateVersion = "25.05";
  };

  imports = [
    ./tmux
    ./i3
    ./vim
    ./alacritty
    ./bash
    ./git
    ./neovim
  ];
}
