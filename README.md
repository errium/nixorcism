<div align="center">

# ~/nixorcism

<img src=".images/screenshot.png" width="900px">

_Errium's incredible NixOS config._

</div>

---

## 🔧 What's the state?

It was, is, and always will be **WIP**.
I tinker with my configs, explore the Nix ecosystem, and stay open-minded to all kinds of software. Because of that, this config will change as often as I feel like it.
Like, I could literally drop home-manager tomorrow.

## 📠 What tools do I use?

There are waaay too many things I use, and I keep switching, so I won't bother listing **everything**.

I write this config _(& pretty much everything else)_ in **helix** with **nixd** as LSP and **alejandra** as formatter.
My primary shell is **fish**, with **bash** hanging around as a fallback _(just in case)_.
For shell QoL I have:

- **zoxide** — to jump around directories
- **nh** — for a slightly better Nix experience
- **nix-search-tv** — to find more bloatware to install
- **opencode** — for occasional vibecoding 😼 _(jk)_

I use a lot more tools, but I'm not listing them here — chances are I'll swap something out tomorrow and forget to update this README.
If you **really** want to know what I use, poke around in `modules/` and `hosts/dudos-machine/configuration.nix` _(my main machine)_.

## ✨ What cool things do I have?

Few things I'm particularly proud of:

- **Theming** is done via [stylix](https://github.com/nix-community/stylix) with dynamic palette generation from wallpapers using [wallust](https://codeberg.org/explosion-mental/wallust). Swap a wallpaper with my `retheme` script >> rebuild >> entire system recolors. Two modes: `theming_static` for fixed palettes, `theming_dynamic` for wallust-generated ones.

- **Installation** is handled by `install.sh`, an unattended installation script — boot a NixOS ISO, clone the repo, run the script, pick a host. Disko handles partitioning declaratively.

- **Architecture** follows the [dendritic pattern](https://github.com/mightyiam/dendritic) — every file is a [flake-parts](https://flake.parts) module. No `default.nix` import chains. System, home-manager, and flake config all live in the same file when they belong together.

## 💬 "Man, I really like your config. Should I run it on my hardware?"

**Lmao, nah.**

This repo is for **reference only** and was never intended for public consumption.
After all, it's not called _"Omarchy: The Sequel."_ 🤷

---

> P.S.
> I made this README because other cool people do. It won't have much useful info and probably will never be updated.
