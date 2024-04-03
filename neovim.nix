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

  home.file.".config/nvim".source = builtins.fetchGit {
    url = "https://github.com/artilugio0/neovim-config";
    rev = "19afab164183a5e80d8f7e7ae9df6b57e26a4a48";
  };
}
