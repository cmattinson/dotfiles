{ config, pkgs, ... }:

{
  home.username = "chris";
  home.homeDirectory = "/Users/chris";

  home.packages = with pkgs; [
    neovim nodejs ripgrep jq fd git
    stow starship bat delta sd tree
    lazygit
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
