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

		# tools
		openvpn
		openvpn3
		keepassxc
		seahorse
    piper

		# web & communication
		firefox
		brave
		thunderbird
		hexchat
		weechat
		discord
		signal-desktop
		dropbox

		neomutt
		isync
		msmtp
		mailcap
		notmuch
		vdirsyncer
		khard
		khal

		# docs & multimedia
		zotero
		jabref
		evince
		libreoffice
		hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-any
		drawio
		xournalpp
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
		jdk
		nodejs
		meld
		vagrant
		ansible
		ansible-lint
		gh
	];
}
