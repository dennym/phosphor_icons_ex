defmodule PhosphorIconsEx.Icon do
  @moduledoc """
  This module defines the data structure and functions for working with icons stored as SVG files.
  """

  @doc """
  Defines the PhosphorIconsEx.Icon struct

  Its fields are:

      * `:file` - the binary of the icon

      * `:name` - the name of the icon

  """
  @fields ~w(file name version)a
  @enforce_keys @fields
  defstruct @fields

  @json (cond do
           Code.ensure_loaded?(JSON) -> JSON
           Code.ensure_loaded?(Jason) -> Jason
           Code.ensure_loaded?(Poison) -> Poison
           true -> raise "need a JSON library available, either JSON or Jason"
         end)

  @phosphor_icons_core_version :code.priv_dir(:phosphor_icons_ex)
                               |> List.to_string()
                               |> Path.join("package-lock.json")
                               |> Path.expand()
                               |> File.read!()
                               |> @json.decode!()
                               |> get_in([
                                 "packages",
                                 "node_modules/@phosphor-icons/core",
                                 "version"
                               ])

  def latest_version, do: @phosphor_icons_core_version

  @type t :: %PhosphorIconsEx.Icon{file: binary, name: String.t()}

  @doc "Parses a SVG file and returns structured data"
  @spec parse!(Path.t()) :: PhosphorIconsEx.Icon.t()
  def parse!(filename) do
    file = File.read!(filename)

    name =
      filename
      |> Path.split()
      |> Enum.at(-1)
      |> String.split(".", trim: true)
      |> List.first()
      |> String.replace("-", "_")
      |> String.to_atom()

    struct!(__MODULE__, file: file, name: name, version: latest_version())
  end

  # "Converts opts to HTML attributes"
  @spec assigns_to_attrs(map) :: list
  defp assigns_to_attrs(assigns) do
    for {key, value} <- assigns do
      key = Phoenix.HTML.Safe.to_iodata(key)
      value = Phoenix.HTML.Safe.to_iodata(value)
      [?\s, key, ?=, ?", value, ?"]
    end
  end

  defp format_attr_key(key) when is_atom(key) do
    key
    |> Atom.to_string()
    |> String.replace("_", "-")
  end

  @doc "Inserts HTML attributes into an SVG icon"
  @spec insert_attrs(binary, map) :: Phoenix.HTML.safe()
  def insert_attrs("<svg" <> rest, %{} = assigns) do
    svg_attrs = parse_svg_attrs("<svg" <> rest)
    assigns = merge_assigns(Map.delete(assigns, :__changed__), svg_attrs)

    # Find where the opening SVG tag ends (the closing >)
    # We need to preserve everything after the opening tag
    case :binary.match(rest, ">") do
      {tag_end_pos, _} ->
        {_opening_tag_content, svg_content} = String.split_at(rest, tag_end_pos + 1)
        Phoenix.HTML.raw(["<svg", assigns_to_attrs(assigns), ">", svg_content])

      :nomatch ->
        # Fallback: if no > found, just append rest (shouldn't happen with valid SVG)
        Phoenix.HTML.raw(["<svg", assigns_to_attrs(assigns), ">", rest])
    end
  end

  defp parse_svg_attrs(svg) when is_binary(svg) do
    svg
    |> String.trim()
    |> LazyHTML.from_fragment()
    |> LazyHTML.attributes()
    |> then(fn [attrs] -> Map.new(attrs) end)
  end

  defp merge_assigns(%{class: class} = assigns, %{"class" => phosphor_class} = svg_attrs) do
    class = Enum.join([phosphor_class, class], " ")
    assigns = Map.new(assigns, fn {k, v} -> {format_attr_key(k), v} end)

    svg_attrs
    |> Map.merge(assigns)
    |> Map.put("class", class)
  end

  defp merge_assigns(%{} = assigns, %{} = svg_attrs) do
    assigns = Map.new(assigns, fn {k, v} -> {format_attr_key(k), v} end)
    Map.merge(svg_attrs, assigns)
  end
end
