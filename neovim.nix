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

  home.file.".config/nvim.original".source = builtins.fetchGit {
    url = "https://github.com/artilugio0/neovim-config";
    rev = "19afab164183a5e80d8f7e7ae9df6b57e26a4a48";
  };
  home.file.".config/nvim.original".onChange = ''
    $DRY_RUN_CMD rm -f $HOME/.config/nvim
    $DRY_RUN_CMD cp -rp $HOME/.config/nvim.original/ $HOME/.config/nvim
  '';
}
