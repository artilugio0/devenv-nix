{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    git
    gnumake
    lua-language-server
    neovim
    ripgrep
    unzip
  ];
}
