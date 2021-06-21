defmodule Moon.Assets.Icons.IconSportWidget do
  use Moon.StatelessComponent

  prop color, :string, values: Moon.colors()
  prop background_color, :string, values: Moon.colors()
  prop font_size, :string
  prop click, :event
  prop class, :string

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/assets/icon"}

    <svg class={"moon-icon #{@class}"} :on-click={@click} style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}>
      <use href="/moon/svgs/icons/icon-sport-widget.svg#item"></use>
    </svg>

    """
  end
end
