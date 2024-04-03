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
    rev = "473eb8491ff33436c72113cf43f0cccb7e1a6299";
  };
  home.file.".config/nvim.original".onChange = ''
    $DRY_RUN_CMD test -d $HOME/.config/nvim && rm -fr $HOME/.config/nvim
    $DRY_RUN_CMD cp -rp $HOME/.config/nvim.original/ $HOME/.config/nvim
    $DRY_RUN_CMD find $HOME/.config/nvim -type d -exec chmod 755 {} \;
    $DRY_RUN_CMD chmod 755 $HOME/.config/nvim
  '';
}
