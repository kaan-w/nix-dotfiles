{ config, pkgs, inputs, system, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # https://nixos.wiki/wiki/AMD_GPU#Make_the_kernel_use_the_correct_driver_early
  boot.initrd.kernelModules = ["amdgpu"];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # AudioRelay uses ports 59100 for server discovery, 59200 for audio transport. (Local Server -> PC)
  networking.firewall.allowedUDPPorts = [ 59100 59200 ];

  # Auto mount/unmount drives
  services.gvfs.enable = true;

  # https://nixos.wiki/wiki/PipeWire#Enabling_PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;    
  };
	
  # https://nixos.wiki/wiki/Bluetooth#Enabling_Bluetooth_support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot= true;

  users.users."zaer1n" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  time.timeZone = "Europe/Istanbul";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.home-manager
    pkgs.vim
    pkgs.tree
  ];

  # https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/
  programs.hyprland.enable = true;
  # Hint Electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # https://github.com/viperML/nh
  programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 4d --keep 3";
		flake = /home/zaer1n/nix;
  };

  system.stateVersion = "24.05";
}