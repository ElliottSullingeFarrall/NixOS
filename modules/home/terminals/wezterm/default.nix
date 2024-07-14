{ config
, lib
, ...
}:

let
  cfg = config.terminals.wezterm;
  inherit (cfg) enable;
in
{
  options = {
    terminals.wezterm.enable = lib.mkEnableOption "WezTerm terminal emulator";
  };

  config = lib.mkIf enable {
    programs.wezterm.enable = true;

    xdg.desktopEntries."org.wezfurlong.wezterm" = {
      name = "WezTerm";
      comment = "Wez's Terminal Emulator";
      icon = "org.wezfurlong.wezterm";
      noDisplay = false;

      exec = "wezterm start --cwd .";
      type = "Application";
      terminal = false;

      categories = [ "System" "TerminalEmulator" "Utility" ];
    };

    programs.waybar.settings.mainBar."hyprland/workspaces".window-rewrite = lib.mkIf config.programs.waybar.enable {
      "wezterm" = "󰆍";
    };
  };
}
