{ config, pkgs, ... }:

{
  services.gnome = {
    gnome-keyring.enable = true;
  };
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    # for packages that are pkgs.*
    gnome-tour
    gnome-connections
  ]) ++ (with pkgs.gnome; [
    # for packages that are pkgs.gnome.*
    epiphany # web browser
    geary # email reader
    evince # document viewer
  ]);
}
