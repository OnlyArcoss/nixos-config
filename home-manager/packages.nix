{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty
    waybar
    wofi
    hyprpaper
    firefox
    zed-editor
    discord
    fastfetch
    btop
    git
    vim
    impala
    bluetui
    wiremix
    pamixer
    playerctl
    lazydocker
    spotify
    bruno
    nautilus
    google-chrome
    chromium
    vlc
    obs-studio
    gnome-disk-utility
    keepassxc
    (colloid-icon-theme.override { colorVariants = [ "purple" ]; })
  ];
}
