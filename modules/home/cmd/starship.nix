{ lib, user, host, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings =  {
      format = lib.concatStrings [
        "[${user}@${host}](bold red) "
        "$directory"
        "$time"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];
      directory = {
        truncate_to_repo = false;
        truncation_length = 5;
      };
      time = {
        format = "[$time]($style) ";
        disabled = false;
        time_format = "%R";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        show_milliseconds = true;
        min_time = 0;
      };
    };
  };
}
