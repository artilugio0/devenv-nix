{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dmd
    dtools
  ];
}
