{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./golang.nix
    ./haskell.nix
    ./neovim.nix
    ./tmux.nix
    ./urxvt.nix
    ./ssh-client.nix
    ./virtmanager.nix
  ];

  # do not touch without first reading the docs
  home.stateVersion = "24.11";

  home.username = "user";
  home.homeDirectory = "/home/user";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    firefox
    git
    tree
    jq
    appimage-run
    kdePackages.okular
  ];

  home.file = {
    ".config/i3".source = ./i3;
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      set -o vi
      export EDITOR=nvim
      export PATH=$PATH:$HOME/scripts:$HOME/bin
    '';
  };

  programs.home-manager.enable = true;
}
