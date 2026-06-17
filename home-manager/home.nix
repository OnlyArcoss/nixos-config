# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./packages.nix
  ];

  home = {
    username = "arcoss";
    homeDirectory = "/home/arcoss";
    stateVersion = "25.11";

    file = {
      ".config/hypr/hyprland.lua".source = ./hypr/hyprland.lua;
      ".config/hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;
      ".config/hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
      ".config/hypr/modules".source = ./hypr/modules;
      ".config/kitty/kitty.conf".source = ./kitty/kitty.conf;
      ".config/waybar".source = ./waybar;
      ".config/wofi".source = ./wofi;
      "Documents/wallpapers".source = ./wallpapers;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Colloid-purple-Dark";
      package = pkgs.colloid-icon-theme;
    };
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  programs.zsh.enable = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
