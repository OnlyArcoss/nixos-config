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

    pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
      hyprcursor = {
        enable = true;
        size = 24;
      };
    };

    file = {
      ".config/hypr/hyprland.lua".source = ./hypr/hyprland.lua;
      ".config/hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;
      ".config/hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
      ".config/hypr/xdph.conf".source = ./hypr/xdph.conf;
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
      name = "Colloid-Purple-Dark";
      package = pkgs.colloid-icon-theme.override {
        colorVariants = [ "purple" ];
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      icon-theme = "Colloid-Purple-Dark";
    };
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  programs.zsh = {
    enable = true;
    # Lance Hyprland depuis le TTY1 (sans display manager ni uwsm)
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
        exec start-hyprland
      fi
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
