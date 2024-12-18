{
  lib,
  pkgs,
  ...
}: let
  VAULTS_DIR = "Vaults";
  VAULTS = ["YKS"];
in {
  home.activation.obsidianCheckFiles = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    $DRY_RUN_CMD mkdir -p $VERBOSE_ARG ${VAULTS_DIR}
    for vault in ${builtins.toString VAULTS}
    do
      $DRY_RUN_CMD rm -rf $VERBOSE_ARG $vault/.obsidian
    done
  '';

  home.file = builtins.listToAttrs (
    builtins.concatMap (vault: let
      fetchObsidianPlugin = {
        url,
        rev,
        files ? ["main.js" "manifest.json" "styles.css"],
        hashes ? builtins.genList (x: "") (builtins.length files),
        dir ? builtins.baseNameOf url,
      }:
        builtins.map (file: {
          name = "${VAULTS_DIR}/${vault}/.obsidian/plugins/${dir}/${file}";
          value.source = pkgs.fetchurl {
            url = "${url}/releases/download/${rev}/${file}";
            hash = builtins.elemAt hashes (lib.lists.findFirstIndex (x: x == file) "" files);
          };
        })
        files;
    in
      [
        {
          name = "${VAULTS_DIR}/${vault}/.obsidian/app.json";
          value.text = builtins.toJSON {
            spellcheck = false;
          };
        }
        {
          name = "${VAULTS_DIR}/${vault}/.obsidian/appearance.json";
          value.text = builtins.toJSON {
            theme = "obsidian";
            cssTheme = "Adwaita";
          };
        }
        {
          name = "${VAULTS_DIR}/${vault}/.obsidian/plugins/obsidian-style-settings/data.json";
          value.text = builtins.toJSON {
            "com-github-birneee-obsidian-adwaita@@adwaita-tabs-short" = false;
            "com-github-birneee-obsidian-adwaita@@adwaita-tabs" = "adwaita-tabs-never";
          };
        }
        {
          name = "${VAULTS_DIR}/${vault}/.obsidian/themes/Adwaita";
          value.source =
            builtins.filterSource (
              name: type:
                (builtins.baseNameOf name == "theme.css")
                || (builtins.baseNameOf name == "manifest.json")
            ) (pkgs.fetchgit {
              url = "https://github.com/birneee/obsidian-adwaita-theme.git";
              hash = "sha256-ic2p2DPFdnJej7kcBP6KeKbZiKC8MKppuAh/6E6Ulh8=";
            });
        }
      ]
      ++ fetchObsidianPlugin {
        url = "https://github.com/mgmeyers/obsidian-style-settings";
        rev = "1.0.9";
        hashes = [
          "sha256-GCirqs2rTFV4twWmJcWFswUS+O+tTHz8WhjnDMNVdGg="
          "sha256-nP/cIM8qoTVIIOAFC2lLD5tXZEbj1dRKNq6LAYflv7g="
          "sha256-7nk30r5QZTqJzLMK5fBXKyNQfVt/EyjQBScaNjB1v9g="
        ];
      }
      ++ fetchObsidianPlugin {
        url = "https://github.com/FlorianWoelki/obsidian-iconize";
        rev = "2.14.4";
        hashes = [
          "sha256-wYQoggO3+anYKIxnfUXvKrVqFys+DV6l/VpuICE1w7U="
          "sha256-UdzG7WCc/jKREAKcRlaFawS/xWmn55xzY9zLgctcWzA="
          "sha256-0IfjUHxu8jastTH7WtuGzRQeWwWHeft6HTvmyHSxNDQ="
        ];
        dir = "obsidian-icon-folder";
      })
    VAULTS
  );
}
