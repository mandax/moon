defmodule Moon.Assets.Duotones.ClaimedReward do
  @moduledoc false

  use Moon.StatelessComponent

  prop(click, :event)
  prop(class, :string)

  # All the other props below are deprecated!
  # Please use only tailwind classes and the class prop
  prop(color, :string, values: Moon.colors())
  prop(height, :string)
  prop(width, :string)
  prop(font_size, :string)
  prop(vertical_align, :string)

  def render(assigns) do
    ~F"""
    <svg
      class={"moon-duotone #{@class} #{@click && "cursor-pointer"}"}
      :on-click={@click}
      style={get_style(
        color: @color,
        height: @height,
        width: @width,
        font_size: @font_size,
        vertical_align: @vertical_align
      )}
    >
      <use href="/moon/assets/svgs/duotones/claimed-reward.svg#item" />
    </svg>
    """
  end
end
