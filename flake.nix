{
  description = "Personal flakes templates";

  outputs = { self, nixpkgs }:
    let
      systems = [
        # arm systems
        "aarch64-darwin"
        "aarch64-linux"

        # x86
        "x86_64-darwin"
        "x86_64-linux"
      ];

      forEachSystem = fn: nixpkgs.lib.genAttrs systems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        fn pkgs);
    in
    {
      templates = {
        blank = {
          path = ./blank;
          description = "flake with empy devshell";
        };
      };

      default = self.templates.blank;

      formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);
    };
}
