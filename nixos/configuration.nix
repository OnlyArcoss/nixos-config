# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
    };
    # Opinionated: disable channels
    channel.enable = false;
  };

  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  networking.hostName = "arc-os";

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    arcoss = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["wheel" "docker" "networkmanager"];
    };
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };

  # Bootloader (BIOS legacy - pas d'UEFI sur cette VM)
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";

    # Réseau
      networking.networkmanager.enable = true;

      # Hyprland
      programs.hyprland = {
        enable = true;
        withUWSM = true;
      };

      # Display manager
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "sddm-astronaut-theme";
        extraPackages = with pkgs; [
          (sddm-astronaut.override {
            embeddedTheme = "hyprland_kath";
            themeConfig.Background = toString ../home-manager/wallpapers/minimal_landscape.jpg;
          })
          kdePackages.qt5compat
        ];
        settings.General.GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=1,QT_FONT_DPI=96";
      };
      # Bluetooth
      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = true;

      # Audio
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
      };

      # XDG portals
      xdg.portal = {
        enable = true;
        extraPortals = [pkgs.xdg-desktop-portal-hyprland];
      };
  programs.zsh.enable = true;
  users.users.arcoss.shell = pkgs.zsh;

  programs.steam.enable = true;

  virtualisation.docker.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
