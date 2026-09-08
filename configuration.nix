{ pkgs, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  services.resolved.enable = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";
  console.keyMap = "br-abnt2";

  users.users.tigela = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  services.fstrim.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "br";
    windowManager.dwm.enable = true;
    displayManager.startx = {
      enable = true;
      generateScript = true;
    };
  };

  services.libinput.enable = true;
  hardware.graphics.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    android-tools
    apktool
    curl
    dmenu
    fd
    file
    gh
    git
    jadx
    jq
    ripgrep
    scrcpy
    st
    telegram-desktop
    unzip
    usbutils
    vim
    wget
    zip
  ];
}
