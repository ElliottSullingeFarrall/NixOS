{ osConfig
, pkgs
, ...
}:

{
  home.stateVersion = "23.05";

  /* ---------------------------------- Theme --------------------------------- */

  gtk.enable = true;

  inherit (osConfig) catnerd;

  /* -------------------------------- Hyprland -------------------------------- */

  home.packages = [
    (pkgs.writeShellScriptBin "hyprwm" ''
      ${pkgs.hyprland}/bin/Hyprland > /dev/null 2>&1
    '')
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l; hyprctl dispatch exit"
      ];
      monitor = [
        "eDP-1, 2256x1504@60, auto, 1.333333"
        ", preferred, auto, auto"
      ];
      input = {
        kb_layout = "gb";
      };
      misc = {
        disable_hyprland_logo = true;
      };
    };
  };
}
