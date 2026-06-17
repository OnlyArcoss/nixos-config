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
    bibata-cursors
    impala
    bluetui
    wiremix
    pamixer
    playerctl
    lazydocker
  ];
}
