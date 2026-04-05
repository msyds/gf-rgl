{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # gf.url = "github:anka-213/cclaw-nix-stuff/nix-flakes";
    sydpkgs.url = "git+https://git.deertopia.net/msyds/sydpkgs";
  };

  outputs = { self, nixpkgs, sydpkgs, ... }@inputs:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      each-system = f: nixpkgs.lib.genAttrs supportedSystems (system: f rec {
	pkgs = import nixpkgs {
	  inherit system;
	  overlays = [
	    # (final: prev: { inherit (gf.packages.${system}) gf-core; })
	    sydpkgs.overlays.default
	  ];
	};
	inherit (pkgs) lib;
        inherit system;
      });
    in {
      # Exposed as a REPL convenience.
      _pkgs = each-system ({ pkgs, ... }: pkgs);

      packages = each-system ({ pkgs, ... }: {
	default = pkgs.callPackage ./package.nix {};
      });

      devShells = each-system ({ pkgs, system, ... }:
        let
	  gf-lsp = import
	    (pkgs.fetchzip {
	      url = "https://github.com/anka-213/gf-lsp/archive/refs/tags/1.0.6.0.tar.gz";
	      hash = "sha256-UAI2qUslzLOWYjTirZJ0y4DZbkPZnVXTY0XtFO8+Rks=";
	    }) {inherit system;};
	in {
	  default = pkgs.mkShell {
	    inputsFrom = [ self.packages.${system}.default ];
	    packages = [
	      gf-lsp.gf-lsp
	      pkgs.gftest
	      pkgs.graphviz
	      pkgs.imagemagick
	    ];
	  };
	});
    };
}
