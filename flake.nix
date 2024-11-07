{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Fetch the specific commit from the Rose-Pine-For-Marp repository
    rosepine = {
      url = "github:rainbowflesh/Rose-Pine-For-Marp/a2b67f6f7b0e03987d1e4076dac92321af57e644";
      # Optionally, you can use `flake = false;` if the repo does not have a `flake.nix`
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      rosepine,
    }:
    {

      packages.x86_64-linux.default =
        let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          theme = "${rosepine}/css/rose-pine.css";

        in
        pkgs.stdenv.mkDerivation {
          name = "simple-marp";
          buildInputs = [ pkgs.marp-cli ]; # Includes marp-cli in the environment
          nativeBuildInputs = [ pkgs.marp-cli ];
          src = ./.;

          # The marp-cli command and arguments
          buildPhase = ''
            ${pkgs.marp-cli}/bin/marp --theme ${theme} slices.md
          '';

          installPhase = ''
            mkdir -p $out
            cp slices.html $out/
          '';
        };
    };
}
