{ config, pkgs, ...}:
{
  imports = [
    ./alacritty
    ./tmux
    ./i3
    ./git
    ./lf
    ./texlive
    ./neovim
    ./shell
  ];
    
  home.username = "ouail";
  home.homeDirectory = "/home/ouail";

  home.packages = with pkgs; [
    gh
    glab
    brave
    tree
    discord
    telegram-desktop
    zotero
  
    (pkgs.nerdfonts.override { 
      fonts = [ "UbuntuMono" ]; 
    })
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
