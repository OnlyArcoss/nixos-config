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
    ./hypr/hyprland.nix
    ./packages.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "arcoss";
    homeDirectory = "/home/arcoss";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
}
