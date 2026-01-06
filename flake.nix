{
  description = "workkflow: personal workflow tooling (hello-world stub)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        wk = pkgs.stdenv.mkDerivation {
          pname = "wk";
          version = "0.0.0-dev";
          src = ./.;

          strictDeps = true;
          dontConfigure = true;
          dontBuild = true;
          nativeBuildInputs = [ pkgs.makeWrapper ];

          installPhase = ''
            runHook preInstall

            install -d $out/lib
            install -m644 ${./lib}/* $out/lib/
            install -Dm755 ${./bin/wk} $out/bin/wk

            wrapProgram $out/bin/wk \
              --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.nushell ]}

            runHook postInstall
          '';
        };
      in
      {
        packages.default = wk;
        packages.wk = wk;

        apps.default = {
          type = "app";
          program = "${wk}/bin/wk";
        };

        devShells.default = pkgs.mkShell {
          packages = [ pkgs.nushell ];
        };

        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
