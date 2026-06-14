# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages.nix
  ];

  home = {
    username = "arcoss";
    homeDirectory = "/home/arcoss";
    stateVersion = "25.11";

    file = {
      ".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
      ".config/hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;
    };
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
}
