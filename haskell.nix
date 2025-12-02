{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    ghc
    cabal-install
  ];

  home.file."./scripts/,haskellnew".source = ./haskell/haskellnew.sh;
  home.file."./scripts/,haskellnew".executable = true;
}
