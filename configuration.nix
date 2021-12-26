{ config, pkgs, ... }:

{
  # IMPORT
  imports =
    [
      ./hardware-configuration.nix
    ];
  # ------------------------------------------------

  # BOOTLOADER
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  # ------------------------------------------------
  
  # TIME
  time.timeZone = "America/Vancouver";
  # ------------------------------------------------

  # NETWORK
  networking.useDHCP = false;
  networking.interfaces.enp0s20u5.useDHCP = true;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.interfaces.wlp5s0.useDHCP = true;
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = 
    [
      "9.9.9.9"
      "9.9.9.11"
    ];
  networking.enableIPv6 = false;
  networking.hostName = "nixos";
  #networking.wireless.enable = true;
  #networking.proxy.default = "http://user:password@proxy:port/";
  #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # LOCALE
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus18";
    keyMap = "us";
  };
  # ------------------------------------------------

  # X11
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.libinput.enable = true;
  # Nvidia Drivers
  services.xserver.videoDrivers = ["nvidia"];
  #services.xserver.desktopManager.xfce.enable = true;
  #services.xserver.xkbOptions = "eurosign:e";
  # -------------------------------------------------

  # HARDWARE
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudio.override { jackaudioSupport = true; };
  # ------------------------------------------------

  # THEMING
  qt5.enable = true;
  #qt5.platformTheme = "gtk2";
  #qt5.style = "gtk2";
  # ------------------------------------------------

  # PRINTING/CUPS
  # services.printing.enable = true;
  # ------------------------------------------------

  # AUDIO
  sound.enable = true;
  # ------------------------------------------------

  # USERS
  users.users.euphoric = {
    isNormalUser = true;
    extraGroups = 
      [ 
        "wheel"
        "audio"
      ];
  };
  # ------------------------------------------------

  # PACKAGE MANAGEMENT
  environment.systemPackages = with pkgs; [
    vim
    wget
    amfora
    appimage-run
    st
    tilix
    discord
    dpkg
    neovim
    git
    gcc
    gtk3
    qtile
    qutebrowser
    onionshare
    freetube
    jupyter
    ffmpeg
    feh
    croc
    mpv
    alacritty
    starship
    github-cli
    cordless
    lutris
    transmission
    aria2
    blender
    kdenlive
    ardour
    qjackctl
    pandoc
    youtube-dl
    virtualbox
    flatpak
    keepassxc
    tenacity
    obs-studio
    gnupg
    openssl
    deltachat-desktop
    retroarch
    xclip
    virt-manager
    gimp
    aseprite
    jack2
    libjack2
    nerd-font-patcher
    rofi
    dmenu
    conky
    neofetch
    btop
    htop
    veracrypt
    icecat-bin
    e2fsprogs
    cordless
    wine
    exfatprogs
    xfsprogs
    ntfs3g
    btrfs-progs
    cmake
    openvpn
    networkmanager-openvpn
    nmap
    pkgconfig
    gdb
    automake
    gnumake
    notepadqq
    pkg-config
    clang-tools
    indent
    splint
    binutils
    ansible
    vagrant
    libreoffice
    lshw
    usbutils
    pciutils
    lm_sensors
    hdparm
    p7zip
    privoxy
    pixz
    pigz
    pbzip2
    unzip
    libxml2
    jq
    yq
    zip
    wget
    micro
    ripgrep
    file
    gtop
    exa
    bat
    rsync
    docker-compose
    docker
    nerdctl
    lsof
    dos2unix
    ipcalc
    whois
    dnsutils
    traceroute
    netcat
    speedtest-cli
    pavucontrol
    pulseaudio-ctl
    flameshot
    pcmanfm
    gparted
    android-tools
    scrcpy
    pkgs.gnome3.gnome-boxes
    pkgs.gnome3.file-roller
    pkgs.gnome3.gnome-tweaks
    pkgs.gnome3.gedit
    pkgs.gnome3.gnome-calendar
    gnomeExtensions.animation-tweaks
    gnomeExtensions.audio-output-switcher
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gamemode
    gnomeExtensions.media-controls
    gnomeExtensions.noannoyance
  ];
  # ------------------------------------------------

  # PROGRAMS
  # GnuPG
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gtk2";
    enableSSHSupport = true;
  };
  # Bash
  programs.bash.enableLsColors = true;
  programs.bash.enableCompletion = true;
  # Misc
  programs.htop.enable = true;
  programs.java.enable = true;
  programs.java.package = pkgs.jre;
  programs.less.enable = true;
  programs.ccache.enable = true;
  programs.mtr.enable = true;
  programs.firejail.enable = true;
  programs.geary.enable = true;
  programs.gnome-disks.enable = true;
  programs.npm.enable = true;
  programs.nm-applet.enable = true;
  programs.nm-applet.indicator = true;
  #programs.qt5ct.enable = true;
  programs.seahorse.enable = true;
  programs.slock.enable = true;
  programs.steam.enable = true;
  programs.thefuck.enable = true;
  programs.thefuck.alias = "fuck";
  programs.tmux.enable = true;
  programs.wireshark.enable = true;
  programs.xonsh.enable = true;
  # Git
  programs.git.enable = true;
  programs.git.package = pkgs.gitFull;
  programs.git.config = {
    init = { defaultBranch = "master"; };
  };
  # Gamemode
  programs.gamemode.enable = true;
  programs.gamemode.enableRenice = true;
  programs.gamemode.settings = {
    general = {
      renice = 10;
    };
    gpu = {
      apply_gpu_optimisations = "accept-responsibility";
      gpu_device = 0;
      amd_performance_level = "high";
    };
    custom = {
      start = "${pkgs.libnotify}/bin/notify-send 'GameMode ENABLED!'";
      end = "${pkgs.libnotify}/bin/notify-send 'GameMode DISABLED!'";
    };
  };
  # Nano
  programs.nano.syntaxHighlight = true;
  programs.nano.nanorc = ''
  set nowrap
  set tabstospaces
  set tabsize 2
  '';
  # Neovim
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.configure = {
    customRC = ''
    '';
    packages.myVimPackage = with pkgs.vimPlugins; {
      start = [ fugitive ];
      opt = [ ];
    };
  };
  programs.neovim.viAlias = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.withPython3 = true;
  programs.neovim.withRuby = true;
  # ------------------------------------------------

  # SECURITY
  #security.doas.enable = true;
  security.sudo.enable = true;
  security.polkit.enable = true;
  security.rtkit.enable = true;
  # ------------------------------------------------

  # SERVICES
  # services.openssh.enable = true;
  services.gnome.core-utilities.enable = false;
  services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
  services.flatpak.enable = true;
  # ------------------------------------------------

  # FIREWALL
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = true;
  networking.firewall.allowPing = false;
  # ------------------------------------------------
 
  # SYSTEM
  system.stateVersion = "21.11";
  xdg.portal.enable = true;
  # ------------------------------------------------

  # NIXPKGS
  nixpkgs.config = {
    allowUnfree = true;
  };
  # ------------------------------------------------

}
