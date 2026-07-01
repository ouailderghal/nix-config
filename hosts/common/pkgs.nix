{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# base
		git
		zip
		unzip
		htop
		fastfetch
		killall
		fzf
		tig
		lf
		stow

		# terminal / shell / editors
		alacritty
		neovim
		vim
		tmux
    zsh

		# security & passwords
		pass
		keepassxc
		seahorse

		# networking
		openvpn
		openvpn3

		# hardware
		piper

		# web & communication
		thunderbird
		discord
		signal-desktop
		dropbox

		# mail & calendar
		neomutt
		isync
		msmtp
		mailcap
		notmuch
		vdirsyncer
		khard
		khal

		# docs
		zotero
		jabref
		evince
		zathura
		libreoffice
		hunspell
		hunspellDicts.en_US
		hunspellDicts.fr-any
		drawio
		xournalpp

		# multimedia
		gimp
		inkscape
		mypaint
		vlc
		obs-studio
		pavucontrol
		pulsemixer

		# programming
		gcc
		gnumake
		go
		gopls
		python313
		jdk25
		maven
		gradle
		nodejs
		meld
		vagrant
		ansible
		ansible-lint
		gh
	];
}
