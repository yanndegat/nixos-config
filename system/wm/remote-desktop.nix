{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      libsecret
      gnome-remote-desktop
      pulseaudio-module-xrdp
      waypipe
      xrdp
    ];

  # Configure gnome remote desktop
  services.gnome.gnome-remote-desktop.enable = true;

  # Configure xrdp
  services.xrdp = {
    enable = true;
    defaultWindowManager = "gnome-remote-desktop";
    audio.enable = true;
    openFirewall = true;
  };
}
