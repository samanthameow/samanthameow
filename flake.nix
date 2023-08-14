{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
   in {
    packages.${system}.default = pkgs.stdenv.mkDerivation {
      name = "ozone's thing, idk.";
      version = "0.1";
      src = ./.;
      nativeBuildInputs = [pkgs.mkdocs];
      buildPhase = ''
      ${pkgs.mkdocs}/bin/mkdocs build
      mkdir -p $out
      mv site/* $out
      '';
    };
  };
}
