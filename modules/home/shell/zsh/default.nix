{ config
, lib
, ...
}:

let
  cfg = config.shell.zsh;
  inherit (cfg) enable;
in
{
  options = {
    shell.zsh.enable = lib.mkEnableOption "zsh shell";
  };

  config = lib.mkIf enable {
    programs.zsh = {
      enable = true;
      dotDir = "${lib.strings.removePrefix config.home.homeDirectory config.xdg.configHome}/zsh";
      history.path = "${config.xdg.stateHome}/zsh/history";
      completionInit = ''
        [ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
        zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
        autoload -U compinit && compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
      '';
      syntaxHighlighting.enable = true;
    };
  };
}
