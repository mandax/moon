defmodule MoonWeb.Components.Badges.AriaSupport do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag size="2xs" class="text-goten bg-nappa">Aria</Tag>
    """
  end
end
