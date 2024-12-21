# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # Set your username
  home = {
    username = "chrisguest";
    homeDirectory = "/home/chrisguest";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    ffmpeg_7-full
    yt-dlp
    vlc

    gnomeExtensions.resource-monitor
    gnome.gnome-tweaks
    
    deluge
    
    diffoci
    diffoscope
    
    mame
    hatari
    fsuae
    
    keepassxc

    imagemagick
    grafx2
    tiled
    pixelorama

    mc
    gettext
    unixtools.xxd

    gnumake

    python312

    chromium
    # not working or clashing
    #imhex
    #nvtopPackages.intel
    #nvtopPackages.nvidia
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Chris Guest";
    userEmail = "chrisguest75@users.noreply.github.com";
    extraConfig = {
      core = {
        pager = "cat";
      };
    };
  };

  programs.tmux = {
    enable = true;
    extraConfig = '' 
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# loud or quiet?
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
setw -g monitor-activity off
set -g bell-action none

# Enable mouse mode (tmux 2.1 and above)
set -g mouse on

set-option -g status on
set-option -g status-interval 1
set-option -g status-justify centre

set-option -g status-position bottom
set-option -g status-style fg=colour136,bg=colour235
set-option -g status-left-length 30
set-option -g status-left-style default
set-option -g status-left "#[fg=green]Session:#S #[fg=black]• #[default]"

# start window numbering at 1
set -g base-index 1

# start pane numbering at 1
set -g pane-base-index 1

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

set -g @plugin 'nhdaly/tmux-scroll-copy-mode'
set -g @plugin 'nhdaly/tmux-better-mouse-mode'


# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
# run -b '~/.tmux/plugins/tpm/tpm'
    '';
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        enabled-extensions = [
          "resource-monitor"
        ];
      };    
      "org/gnome/shell/extensions/hidetopbar" = {
        enable-active-window = false;
        enable-intellihide = false; 
      };
      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        font-antialiasing = "grayscale";
        font-hinting = "slight";
        gtk-theme = "Nordic";
        toolkit-accessibility = true;
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "close,minimize,maximize:appmenu";
        num-workspaces = 10;
      };
      "org/gnome/shell/extensions/pop-shell" = {
        focus-right = "disabled";
        tile-by-default = true;
        tile-enter = "disabled";
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click=false;
        two-finger-scrolling-enabled=true;
        natural-scroll=false;
      };
      "org/gnome/desktop/peripherals/mouse" = {
        natural-scroll=false;
      };
    };


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
