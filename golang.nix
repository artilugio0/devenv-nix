{ config, pkgs, ...}:

{
  home.file."./scripts/,gonew".source = ./golang/gonew.sh;
  home.file."./scripts/,gonew".executable = true;
}
