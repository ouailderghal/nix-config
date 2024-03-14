{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs
    gcc
    nodejs
    go
    gopls
    python311
    gnumake
    rustup
    meld
    onefetch
    vagrant
    ansible
    ansible-lint
    google-cloud-sdk
  ];
}
