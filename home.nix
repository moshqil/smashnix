{ config, pkgs, lib, ... }:

{
  home.stateVersion = "22.05";

  # https://github.com/malob/nixpkgs/blob/master/home/default.nix

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Htop
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.htop.enable
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      jupyterlab = "nix run ~/code/shells/da/macos#jupyterlab";
      # clan = "${pkgs.clang}/bin/clang++";
      nvim = "CC=${pkgs.gcc}/bin/gcc nvim";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "maria.m.marchenko@mail.ru";
    userName = "Maria Marchenko";
    delta.enable = true;
    extraConfig = {
      pull.rebase = true;
    };
  };

  # programs.neovim.enable = true;

  home.packages = with pkgs; [
    # Some basics
    # (lib.hiPrio clang)
    gcc
    cargo
    python3
    coreutils
    curl
    git
    pkgs.unstable.qbittorrent  # unsupported system
    jq
    just
    pkgs.unstable.neovim
    ripgrep
    tmate
    # vlc
    unzip
    wget
    zip
    fd
    luarocks
    nodejs
    nodePackages.npm
    # nodePackages.remark
    tree-sitter
    poetry
    m-cli # useful macOS CLI commands
  ];
}
