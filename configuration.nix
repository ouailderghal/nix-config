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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ouail = {
    isNormalUser = true;
    description = "Ouail Derghal";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
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

    # LibreOffice
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-any

    # Other
    hugo
  ];

  # Enable BrowserPass
  programs.browserpass.enable = true;

  # Some programs need SUID wrappers, can be configured further or are started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable Gnome keyring.
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.lightdm.enableGnomeKeyring = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  # Enable Docker Engine.
  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
