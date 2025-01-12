defmodule MoonWeb.Examples.Design.AvatarExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar size="xs" />
      <Avatar size="sm" />
      <Avatar />
      <Avatar size="lg" />
      <Avatar size="xl" />
      <Avatar size="2xl" />
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar name="xs" size="xs" />
      <Avatar name="sm" size="sm" />
      <Avatar name="md" />
      <Avatar name="lg" size="lg" />
      <Avatar name="xl" size="xl" />
      <Avatar name="2xl" size="2xl" />
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar image_url="https://picsum.photos/id/547/100" size="xs" />
      <Avatar image_url="https://picsum.photos/id/547/100" size="sm" />
      <Avatar image_url="https://picsum.photos/id/547/100" />
      <Avatar image_url="https://picsum.photos/id/547/100" size="lg" />
      <Avatar image_url="https://picsum.photos/id/547/100" size="xl" />
      <Avatar image_url="https://picsum.photos/id/547/100" size="2xl" />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar size="xs" />
      <Avatar size="sm" />
      <Avatar />
      <Avatar size="lg" />
      <Avatar size="xl" />
      <Avatar size="2xl" />
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar name="xs" size="xs" />
      <Avatar name="sm" size="sm" />
      <Avatar name="md" />
      <Avatar name="lg" size="lg" />
      <Avatar name="xl" size="xl" />
      <Avatar name="2xl" size="2xl" />
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Avatar image_url="https://picsum.photos/id/547/100" size="xs" />
      <Avatar image_url="https://picsum.photos/id/547/100" size="sm" />
      <Avatar image_url="https://picsum.photos/id/547/100" />
      <Avatar image_url="https://picsum.photos/id/547/100" size="lg" />
      <Avatar image_url="https://picsum.photos/id/547/100" size="xl" />
      <Avatar image_url="https://picsum.photos/id/547/100" size="2xl" />
    </div>
    """
  end
end
