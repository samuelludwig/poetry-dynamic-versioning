{
  description =
    "Plugin for Poetry to enable dynamic versioning based on VCS tags";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.poetry2nix.url = "github:nix-community/poetry2nix";

  outputs = { self, nixpkgs, flake-utils, poetry2nix }: {
    # Nixpkgs overlay providing the application
    overlay = nixpkgs.lib.composeManyExtensions [ poetry2nix.overlay ];
    src = ./.;
  };
}
