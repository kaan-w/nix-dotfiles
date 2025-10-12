{ pkgs, inputs, host, user, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/core/uwsm.nix
    ../../modules/core/nix.nix
    
    inputs.niri.nixosModules.niri
  ];

  # https://wiki.nixos.org/wiki/Systemd/boot#Usage
  boot.loader.systemd-boot.enable = true;

  # Whether the installation process is allowed to modify EFI boot variables
  boot.loader.efi.canTouchEfiVariables = true;
  
  # https://nixos.wiki/wiki/AMD_GPU#Make_the_kernel_use_the_correct_driver_early
  boot.initrd.kernelModules = [ "amdgpu" ];

  # https://wiki.nixos.org/wiki/AMD_GPU#Basic_Setup
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # https://nixos.wiki/wiki/Bluetooth#Enabling_Bluetooth_support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  networking.hostName = host;
  networking.networkmanager.enable = true;

  # 59100: AudioRelay server discovery
  # 59200: AudioRelay audio transport
  networking.firewall.allowedUDPPorts = [59100 59200];

  # Auto mount/unmount drives
  services.gvfs.enable = true;

  # https://wiki.nixos.org/wiki/PipeWire#Configuring_PipeWire
  # rtkit allows Pipewire to use the realtime scheduler for increased performance
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment the following
    # jack.enable = true;
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # https://wiki.nixos.org/wiki/Command_Shell#For_all_users
  users.defaultUserShell = pkgs.zsh;

  time.timeZone = "Europe/Istanbul";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    inputs.nur.overlays.default
  ];

  environment.sessionVariables = {
    # https://wiki.nixos.org/wiki/Visual_Studio_Code#Wayland
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    vim
    tree
  ];

  # https://wiki.nixos.org/wiki/Secret_Service#GNOME_Keyring
  services.gnome.gnome-keyring.enable = true;

  # https://wiki.nixos.org/wiki/Hyprland#Installation
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;

  # https://wiki.nixos.org/wiki/Niri#Installation
  programs.niri.enable = true;

  # https://nixos.wiki/wiki/Command_Shell#Enable
  programs.zsh.enable = true;

  # https://nixos.wiki/wiki/Steam#Install
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # https://nixos.org/manual/nixos/unstable/options#opt-system.stateVersion
  system.stateVersion = "25.05";
}