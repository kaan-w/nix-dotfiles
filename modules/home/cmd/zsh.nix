{ config, lib, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 5000;
      ignoreAllDups = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };

    shellAliases = {
      cat = "bat";
      man = "batman";
      ff = "fastfetch";
    };
    
    initContent = lib.mkIf pkgs.stdenv.isLinux ''
      if uwsm check may-start && uwsm select; then
	      exec uwsm start default
      fi
    '';
  };
}