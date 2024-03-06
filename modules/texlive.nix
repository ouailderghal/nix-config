{ config, pkgs, ... }:
let
  tex = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive) 
        scheme-full
        graphics
        dvisvgm dvipng
        wrapfig amsmath ulem hyperref capt-of;
    }
  );
in
{
  environment.systemPackages = with pkgs; [ tex ];
}
