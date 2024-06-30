{ ...
}:

{
  imports = [
    ./gtklock
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1"; # Causes warning in vscode
  };

  environment.pathsToLink = [ "/share/xdg-desktop-portal" ]; # https://github.com/nix-community/home-manager/pull/5158#issuecomment-2043764620
}
