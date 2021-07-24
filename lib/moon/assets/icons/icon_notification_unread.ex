defmodule Moon.Assets.Icons.IconNotificationUnread do
  use Moon.StatelessComponent

  prop color, :string, values: Moon.colors()
  prop background_color, :string, values: Moon.colors()
  prop font_size, :string
  prop click, :event
  prop class, :string

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/assets/icon"}

    <svg class={"moon-icon #{@class} #{@click && "cursor-pointer"}"} :on-click={@click} style={get_style(color: @color, background_color: @background_color, font_size: @font_size)}>
      <use href="/moon/assets/svgs/icons/icon-notification-unread.svg#item"></use>
    </svg>

    """
  end
end
