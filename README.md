# PhosphorIconsEx

[![hex.pm](https://img.shields.io/hexpm/v/phosphor_icons_ex.svg)](https://hex.pm/packages/phosphor_icons_ex)
[![docs](https://img.shields.io/badge/hex-docs-blue.svg)](https://hexdocs.pm/phosphor_icons_ex)
[![ci](https://github.com/dennym/phosphor_icons_ex/actions/workflows/ci.yml/badge.svg)](https://github.com/dennym/phosphor_icons_ex/actions/workflows/ci.yml)
[![Hex Downloads](https://img.shields.io/hexpm/dt/phosphor_icons_ex)](https://hex.pm/packages/phosphor_icons_ex)

This package adds a convenient way of using [Phosphor](https://phosphoricons.com/) with your Phoenix.LiveView applications.

> Phosphor is a flexible icon family for interfaces, diagrams, presentations — whatever, really.
> * 1,248 icons and counting
> * 6 weights: Thin, Light, Regular, Bold, Fill, and Duotone
> * Designed at 16 x 16px to read well small and scale up big
> * Raw stroke information retained to fine-tune the style

You can find the original repo [here](https://github.com/phosphor-icons/homepage#phosphor-icons).

> Note: As this lib is dealing with over 9000 icons the compile time may be longer than usual.

## Installation

> **Warning:** This library only supports phoenix_live_view v1.0+

Add `phosphor_icons_ex` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:phosphor_icons_ex, "~> 2.0"}
  ]
end
```

Then run `mix deps.get`.

## Usage

### With Heex

```elixir
<PhosphorIconsEx.armchair class="h-4 w-4" aria-hidden/>

<PhosphorIconsEx.armchair_thin class="h-4 w-4" aria-hidden/>
<PhosphorIconsEx.armchair_light class="h-4 w-4" aria-hidden/>
<PhosphorIconsEx.armchair_bold class="h-4 w-4" aria-hidden/>
<PhosphorIconsEx.armchair_fill class="h-4 w-4" aria-hidden/>
<PhosphorIconsEx.armchair_duotone class="h-4 w-4" aria-hidden/>
```

where `armchair` refers to a specific icon name and the `_bold` for the specific type.

> Icon names can be retrieved from `PhosphorIconsEx.icon_names/0`
> Icons can be searched with `PhosphorIconsEx.search_icons/1`

## Thanks
* phosphor for the icons licensed under [MIT](https://github.com/phosphor-icons/homepage/blob/master/LICENSE)
* [@zoedsoupe](https://github.com/zoedsoupe) which heavily inspired this package with [lucide_icons](https://github.com/zoedsoupe/lucide_icons/) licensed under [BSD](https://github.com/zoedsoupe/lucide_icons/blob/main/LICENSE)

## Disclaimer
This package is not affiliated with Phosphor Icons.

This repo is using the Phosphor Icons Core repository as a source: @phosphor-icons/core 
