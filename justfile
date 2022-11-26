switch:
  mkdir -p /tmp/darwin-build
  cd /tmp/darwin-build
  darwin-rebuild switch --flake {{justfile_directory()}}
  rm -r {{justfile_directory()}}/result

update:
  nix flake update
  just switch
  sudo nix-collect-garbage -d
  sudo nix-store --optimise
