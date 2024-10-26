{
  xdg.configFile."vesktop/settings/settings.json".text = builtins.toJSON {
    themeLinks = [
      "https://raw.githubusercontent.com/KillYoy/DiscordNight/master/DiscordNight.theme.css"
    ];
  };
}