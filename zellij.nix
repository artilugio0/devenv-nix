{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zellij
  ];

  home.file = {
    ".config/zellij".source = ./zellij;

    "./scripts/,devmux".source = ./zellij/devmux.sh;
    "./scripts/,devmux".executable = true;
  };
}
