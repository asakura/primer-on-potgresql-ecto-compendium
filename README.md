# primer-on-potgresql-ecto-compendium

## Rendering

`nix develop` starts a shell with pandoc and tectonic. Run the commands below
from the repository root. Each one writes its output to the current directory.

```sh
nix develop
pandoc primer_on_postgresql_ecto_compedium.org -s -o primer.md
pandoc primer_on_postgresql_ecto_compedium.org -s --toc -o primer.html
pandoc primer_on_postgresql_ecto_compedium.org --toc --pdf-engine=tectonic \
  -V mainfont=DejaVuSerif \
  -V mainfontoptions="Path=$DEJAVU_FONT_DIR/,Extension=.ttf,UprightFont=DejaVuSerif,BoldFont=DejaVuSerif-Bold,ItalicFont=DejaVuSerif-Italic,BoldItalicFont=DejaVuSerif-BoldItalic" \
  -V monofont=DejaVuSansMono \
  -V monofontoptions="Path=$DEJAVU_FONT_DIR/,Extension=.ttf,UprightFont=DejaVuSansMono,BoldFont=DejaVuSansMono-Bold,ItalicFont=DejaVuSansMono-Oblique,BoldItalicFont=DejaVuSansMono-BoldOblique" \
  -o primer.pdf
```

The PDF uses DejaVu fonts because the default LaTeX fonts have no Cyrillic
glyphs, and the Org file is mostly Russian. `DEJAVU_FONT_DIR` is set by the
dev shell.
