with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "mallivastaus-env";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "mallivastaus";
  buildInputs = [env ruby];
}
