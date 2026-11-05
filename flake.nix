{
  description = "Dev shell for rendering the primer Org file to Markdown, HTML and PDF";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    in
    {
      devShells = nixpkgs.lib.genAttrs systems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            # pandoc: reads Org and writes Markdown and HTML.
            # tectonic: PDF engine for pandoc (--pdf-engine=tectonic).
            packages = [
              pkgs.pandoc
              pkgs.tectonic
            ];
            # DejaVu has Cyrillic glyphs; the default Latin Modern fonts do not.
            DEJAVU_FONT_DIR = "${pkgs.dejavu_fonts}/share/fonts/truetype";
          };
        }
      );
    };
}
