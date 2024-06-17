{ config, pkgs, ...}:

{
  home.file."./scripts/,haskellnew".source = ./haskell/haskellnew.sh;
  home.file."./scripts/,haskellnew".executable = true;
}
