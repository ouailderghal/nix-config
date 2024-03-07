{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
      zotero
  ];
}
