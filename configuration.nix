{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  # Hostname.
  networking.hostName = "tokyo"; 
  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = false;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profilea
  environment.systemPackages = with pkgs; [
    # Programming tools
    gcc
    nodejs
    go
    gopls
    python3
    gnumake
    
    # Command-line tools
    git
    tmux
    neovim
    tree
    pass
    tig
    wget
    zip
    unzip
    xclip
    meld
    onefetch
    neomutt
    neofetch

    # Shells
    zsh

    # Other
    hugo
  ];

  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
