{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
      dvisvgm dvipng
      wrapfig amsmath ulem hyperref capt-of;
  });
in
{
  home.packages = with pkgs; [
    tex
  ];
}
