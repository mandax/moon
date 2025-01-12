# This component is deprecated, use /components/typography/ css classes
defmodule MoonWeb.Pages.Components.Typography.CaptionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Caption
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/caption",
        name: "Caption"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'color_class',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Component or element which Tooltip wraps around'
      },
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Content for caption'
      },
      %{
        :name => 'text_align_class',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'TODO - Text alignment (this should be an enum set of values)'
      },
      %{
        :name => 'is_regular',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Is regular font weight'
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Caption">
        <p>
          Component for presenting short info.
        </p>
        <p class="font-medium">
          NB! The component is depricated. Please use our
          <a
            href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Components.TypographyPage,
              theme_name: @theme_name,
              direction: @direction
            )}
            class="text-piccolo transition-colors duration-200 hover:text-hit visited:text-hit"
          >
            new Typography
          </a>
          built with Tailwind.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Colors" id="example_1">
        <:example>
          <Caption>Defaul color is Bulma</Caption>
          <Caption color_class="text-piccolo">Piccolo</Caption>
          <Caption color_class="text-trunks">Trunks</Caption>
          <Caption color_class="text-krillin">Krillin</Caption>
        </:example>

        <:code>{example_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Text Align" id="example_2">
        <:example>
          <Caption>Text-align is not specified</Caption>
          <Caption text_align_class="text-center">Centered text</Caption>
          <Caption text_align_class="text-right">Right alignment</Caption>
        </:example>

        <:code>{example_2_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def example_1_code do
    """
    <Caption>Defaul color is Bulma</Caption>
    <Caption color_class="text-piccolo">Piccolo</Caption>
    <Caption color_class="text-trunks">Trunks</Caption>
    <Caption color_class="text-krillin">Krillin</Caption>
    """
  end

  def example_2_code do
    """
    <Caption>Text-align is not specified</Caption>
    <Caption text_align_class="text-center">Centered text</Caption>
    <Caption text_align_class="text-right">Right alignment</Caption>
    """
  end
end
