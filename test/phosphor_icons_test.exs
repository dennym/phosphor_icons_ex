defmodule PhosphorIconsExTest do
  use ExUnit.Case, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  test "renders icon" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse />
      """)

    assert html =~ "<svg"
  end

  test "renders icon with class" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse class="h-4 w-4" />
      """)

    assert html =~ "h-4 w-4"
  end

  test "renders icon with assigns" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse aria_hidden={false} />
      """)

    assert html =~ ~s(<svg aria-hidden="false")
  end

  test "renders icon that may be deprecated, with different package version" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.twitter_logo />
      """)

    assert html =~ "<svg"
  end

  test "renders icon with different thin weight" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse_thin />
      """)

    assert html =~ "<svg"
  end

  test "renders icon with different light weight" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse_light />
      """)

    assert html =~ "<svg"
  end

  test "renders icon with different bold weight" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse_bold />
      """)

    assert html =~ "<svg"
  end

  test "renders icon with different fill weight" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse_fill />
      """)

    assert html =~ "<svg"
  end

  test "renders icon with different duotone weight" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse_duotone />
      """)

    assert html =~ "<svg"
  end

  test "insert_attrs preserves SVG content when called directly with SVG string" do
    svg_string = ~s(<svg class="test" viewBox="0 0 24 24"><path d="M12 2v20"/></svg>)
    assigns = %{class: "custom-class"}

    result = PhosphorIconsEx.Icon.insert_attrs(svg_string, assigns)
    html = Phoenix.HTML.safe_to_string(result)

    # Verify the SVG tag is properly closed
    assert html =~ ~r/<svg[^>]*>/

    # Verify the SVG content (path) is preserved
    assert html =~ ~r/<path/

    # Verify the SVG is properly closed
    assert html =~ ~r/<\/svg>/

    # Verify custom class was added
    assert html =~ "custom-class"
  end

  test "renders icon correctly with span element after it" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <PhosphorIconsEx.pulse class="h-4 w-4" />
      <span>Test content</span>
      """)

    # Verify the SVG is properly closed before the span
    assert html =~ ~r/<\/svg>\s*<span>/

    # Verify the span element is present and correct
    assert html =~ ~r/<span>Test content<\/span>/

    # Verify we don't have malformed HTML where SVG attributes leak into the span
    refute html =~ ~r/<svg[^>]*\s<=""/
    refute html =~ ~r/<span[^>]*<=""/

    # Verify both elements are present
    assert html =~ ~r/<svg[^>]*>/
    assert html =~ ~r/<span>/
  end
end
