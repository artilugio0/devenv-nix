{ config, pkgs, ... } :

{
  home.file.".gitconfig".source = ./git/gitconfig;
}
