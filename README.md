# PhosphorIcons

This package adds a convenient way of using [Phosphor](https://phosphoricons.com/) with your Phoenix.LiveView applications.

> Phosphor is a flexible icon family for interfaces, diagrams, presentations — whatever, really.
> * 1,248 icons and counting
> * 6 weights: Thin, Light, Regular, Bold, Fill, and Duotone
> * Designed at 16 x 16px to read well small and scale up big
> * Raw stroke information retained to fine-tune the style
> * You can find the original repo [here](https://github.com/phosphor-icons/homepage#phosphor-icons).

## Installation

> **Warning:** This library only supports phoenix_live_view v1.0+

Add `phosphor_icons_ex` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:phosphor_icons_ex, "~> 2.0"} # x-release-please-version
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

## Disclaimer
This package is not affiliated with Phosphor Icons.

This repo is using the Phosphor Icons Core repository as a source: phosphor-icons/core.
