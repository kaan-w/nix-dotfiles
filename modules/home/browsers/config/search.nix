{
  force = true;
  default = "ddg";
  engines = {
    "GitHub (code)" = {
      urls = [ { template = "https://github.com/search?q={searchTerms}&type=code"; } ];
      icon = "https://github.githubassets.com/favicons/favicon-dark.png";
      definedAliases = [ "@ghc" ];
    };

    "GitHub (repository)" = {
      urls = [ { template = "https://github.com/search?q={searchTerms}&type=repository"; } ];
      icon = "https://github.githubassets.com/favicons/favicon-dark.png";
      definedAliases = [ "@ghr" ];
    };
          
    "Nixpkgs" = {
      urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}&channel=unstable"; } ];
      icon = "https://search.nixos.org/favicon-96x96.png";
      definedAliases = [ "@np" ];
    };

    "NixOS Options" = {
      urls = [ { template = "https://search.nixos.org/options?query={searchTerms}&channel=unstable"; } ];
      icon = "https://search.nixos.org/favicon-96x96.png";
      definedAliases = [ "@no" ];
    };

    "Home Manager Options" = {
      urls = [ { template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master"; } ];
      icon = "https://home-manager-options.extranix.com/images/favicon.png";
      definedAliases = [ "@hm" ];
    };

    "NixOS Wiki" = {
      urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
      icon = "https://wiki.nixos.org/favicon.ico";
      definedAliases = [ "@nw" ];
    };

    "Arch Wiki" = {
      urls = [ { template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; } ];
      icon = "https://wiki.archlinux.org/favicon.ico";
      definedAliases = [ "@aw" ];
    };

    "bing".metaData.hidden = true;
    "google".metaData.hidden = true;
    "wikipedia".metaData.hidden = true;
  };
}