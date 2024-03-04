{ config, pkgs, ...}:
{
  imports = [
    ./alacritty
    ./tmux
    ./zsh
    ./i3
    ./git
    ./lf
    ./texlive
  ];
    
  home.username = "ouail";
  home.homeDirectory = "/home/ouail";

  home.packages = with pkgs; [
    gh
    brave
    tree
    discord
    zotero
  
    (pkgs.nerdfonts.override { 
      fonts = [ "UbuntuMono" ]; 
    })
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
