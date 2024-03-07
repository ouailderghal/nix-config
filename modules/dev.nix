{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    nodejs
    go
    gopls
    python3
    gnumake
    rustup
  ];

}
