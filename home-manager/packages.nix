{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty
    waybar
    wofi
    hyprpaper
    firefox
    zed
    discord
    fastfetch
    btop
    git
    vim
  ];
}
