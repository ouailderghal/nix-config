{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "tokyo"; 
  networking.networkmanager.enable = true;
  services.printing.enable = false;

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
    meld
    onefetch
    neomutt
    neofetch
  ];

  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
