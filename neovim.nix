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
    rev = "6ca0340cbc9ac9f6b79fd051096664b4f02fad44";
  };
  home.file.".config/nvim.original".onChange = ''
    $DRY_RUN_CMD test -d $HOME/.config/nvim && rm -fr $HOME/.config/nvim
    $DRY_RUN_CMD cp -rp $HOME/.config/nvim.original/ $HOME/.config/nvim
    $DRY_RUN_CMD find $HOME/.config/nvim -type d -exec chmod 755 {} \;
    $DRY_RUN_CMD chmod 755 $HOME/.config/nvim
  '';
}
