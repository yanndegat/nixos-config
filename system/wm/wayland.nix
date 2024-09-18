{ config, pkgs, ... }:

{
  imports = [ ./pipewire.nix
              ./dbus.nix
              ./gnome-keyring.nix
              ./fonts.nix
            ];

  environment.systemPackages = with pkgs;
    [ wayland gnome.gdm ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:escape";
    };
    excludePackages = [ pkgs.xterm ];

    displayManager.gdm = {
      enable = true;
      wayland = true;
      autoSuspend = true;
    };
  };
}
