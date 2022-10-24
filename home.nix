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

  programs.git = {
    enable = true;
    userEmail = "maria.m.marchenko@mail.ru";
    userName = "Maria Marchenko";
    delta.enable = true;
    extraConfig = {
      pull.rebase = true;
    };
  };

  home.packages = with pkgs; [
    # Some basics
    clang
    coreutils
    curl
    git
    jq
    just
    neovim
    ripgrep
    tmate
    unzip
    wget
    zip
  ] ++ lib.optionals stdenv.isDarwin [
    m-cli # useful macOS CLI commands
  ];
}
