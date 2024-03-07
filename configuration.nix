{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "tokyo"; 
  networking.networkmanager.enable = true;

  # List packages installed in system profilea
  environment.systemPackages = with pkgs; [

    # Command-line tools
    git
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

}
