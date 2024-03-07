{ config, pkgs, ... }:
{
  imports = [
    ./alacritty
    ./tmux
    ./i3
    ./git
    ./lf
    ./neovim
    ./shell
    ./mbsync
    ./msmtp
    ./neomutt
  ];

  home = {
    username = "ouail";
    homeDirectory = "/home/ouail";
    stateVersion = "23.11";

    packages = with pkgs; [
      zotero
    ];
  };

  programs.home-manager.enable = true;
}
