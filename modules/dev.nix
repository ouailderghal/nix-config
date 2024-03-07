{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    nodejs
    go
    gopls
    python311
    gnumake
    rustup

    meld
    onefetch
  ];
}
