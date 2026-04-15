let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/master";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  common = import ../lib/common.nix { inherit pkgs; };
in

pkgs.mkShell {
  name = "mpv-env";

  packages = with pkgs; [
    alsa-lib
    ffmpeg
    libass
    libplacebo
    mesa
    pulseaudio
    libx11
    libdrm
    libxfixes
    libxscrnsaver
    luajit
    python313Packages.docutils
    python314Packages.docutils
    libxext
    libxpresent
    libxrandr
    libxv
    kdePackages.wayland
    kdePackages.wayland-protocols
    libva
    libjpeg
    libuchardet
    vulkan-loader
    vulkan-headers
    libarchive
    python313Packages.yt-dlp
  ] ++ common.buildInputs;
}
