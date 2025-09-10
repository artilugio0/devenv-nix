{ config, pkgs, ...}:

{
  home.file."./scripts/,resolution".source = ./virtmanager/resolution.sh;
  home.file."./scripts/,resolution".executable = true;
}
