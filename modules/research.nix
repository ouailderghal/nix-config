{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
      texlive.combined.scheme-full
      zotero
      jabref
  ];
}
