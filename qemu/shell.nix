let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/master";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  common = import ../common.nix { inherit pkgs; };
in

pkgs.mkShell {
  name = "qemu-env";

  packages = with pkgs; [
    glib
    pixman
    alsa-lib
    dtc
    libslirp
    SDL2
    libx11
    python313Packages.sphinx-rtd-theme
  ] ++ common.buildInputs;

  QEMU_ARCH = "x86_64-softmmu,i386-softmmu";
}
