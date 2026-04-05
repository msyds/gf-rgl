{ stdenv
, ghc
, gf-core
}:

stdenv.mkDerivation {
  name = "gf-rgl";
  src = ./.;
  buildInputs = [ ghc gf-core ];
  # Keep references to source, so go to definition works
  # postUnpack = ''
  #   rm -r source/src
  #   ln -s $src/src source/src
  # '';
  LC_ALL = "C.UTF-8";
  buildPhase = ''
    runghc Setup.hs build
  '';
  installPhase = ''
    mkdir -p $out/share/gf/lib
    runghc Setup.hs copy --dest=$out/share/gf/lib
  '';
}
