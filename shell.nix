with (import <nixpkgs> {});
let
  # Instructions: Modify Gemfile. Then, to update the environment, delete
  # gemset.nix and Gemfile.lock files and run bundix -l. Restart the nix-shell
  # after that.
  env = bundlerEnv {
    name = "jekyll-gems";
    inherit ruby;
    gemdir = ./.;
  };
in stdenv.mkDerivation {
  name = "jekyll-shell";
  buildInputs = [ bundix env env.wrappedRuby ];
}
