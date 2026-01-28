{ config, pkgs, ... }:
{
	imports = [
		./desktop.nix
		./fonts.nix
		./pkgs.nix
		./tex.nix
		./virt.nix
		./firefox.nix
	];

	system.stateVersion = "25.05";
	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	services.xserver.xkb = {
		layout = "fr";
		variant = "";
	};
	console.keyMap = "fr";

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = false;
	};

  security.pam.services.lightdm.enableGnomeKeyring = true;
  programs.ssh.startAgent = true;

	security.pam = {
		services.login.u2fAuth = true;
		services.sudo.u2fAuth = true;
		services.i3lock.u2fAuth = true;
	};

	services.udev.packages = [ pkgs.yubikey-personalization ];
	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Paris";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	services.printing.enable = true;

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	users.users.ouail = {
		isNormalUser = true;
		description = "Ouail Derghal";
		extraGroups = [ "networkmanager" "wheel" ];
	};
}
