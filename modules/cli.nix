{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    pass
    tree
    tig
    wget
    zip
    unzip
    neofetch
  ];
}
