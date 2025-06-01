{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    mcp-hub.url = "github:ravitemer/mcp-hub";

  };
  outputs =
    {
      self,
      mcp-hub,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      with pkgs;
      {
        devShells = {
          default = mkShell {
            buildInputs = [
              bun
              mcp-hub.packages."${system}".default
              nix
              nixfmt-rfc-style
              nodejs_24
              typescript-language-server
              tailwindcss-language-server
            ];
          };
        };
      }
    );
}
