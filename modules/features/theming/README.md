> [!NOTE]
> Theming is split into two modes - **static** and **dynamic** - both built on top of stylix.
>
> - `static.nix` - uses a hardcoded base16 palette from `stylix/_colors.nix`
> - `dynamic.nix` - uses a wallust-generated palette from `wallust/palette.yaml`

> [!WARNING]
> `theming_stylix`, `theming_wallust` and `theming_defaults` are internal - I don't activate them manually.
> Ideally these wouldn't be flake-parts modules at all, making them truly unimportable -
> but that would require `default.nix` files, which is a tradeoff not worth making.

> [!NOTE]
> `stylix/overrides/` contains per-program stylix theme patches.
> Each file extends a corresponding program module (e.g. `overrides/zed.nix` extends `editor_zed`).
> Overrides activate automatically as part of the parent module, and check for stylix presence via
> `config.stylix.enable or false` before applying.
