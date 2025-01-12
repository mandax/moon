defmodule MoonWeb.Pages.Design.SnackbarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.SnackbarExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/snackbar",
        name: "Snackbar"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_aria_support
        is_rtl_support
        title="Snackbar"
        image="facing/components/snackbar.png"
      >
        <p>
          The snackbar component is a non-disruptive message that appears on the interface to provide quick, at-a-glance feedback on the outcome of an action.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        SnackbarExample.Default,
        SnackbarExample.Positions,
        SnackbarExample.Options,
        SnackbarExample.SemanticTypes,
        SnackbarExample.AutoClose,
        SnackbarExample.Customization
      ]} />

      <PropsTable
        title="Snackbar props"
        data={[
          %{
            :name => 'trigger',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Clickable trigger element, see Snackbar.Trigger'
          },
          %{
            :name => 'content',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Content of Snackbar item, see Snackbar.Content'
          },
          %{
            :name => 'icon',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Icon slot of Snackbar item, see Snackbar.Icon'
          },
          %{
            :name => 'close',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Close button slot of Snackbar item, see Snackbar.Close'
          },
          %{
            :name => 'position',
            :type => 'top-left | top-center | top-right | bottom-left | bottom-center | bottom-right',
            :required => 'No',
            :default => 'top-right',
            :description => 'Close button slot of Snackbar item, see Snackbar.Close'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          },
          %{
            :name => 'is_open',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether or not the snackbar is open'
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Content props"
        data={[
          %{
            :name => 'header',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Header slot of Snackbar item, see Snackbar.Header'
          },
          %{
            :name => 'message',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Message slot of Snackbar item, see Snackbar.Message'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Header props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Header of Snackbar item'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Message props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Message of Snackbar item'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />

      <PropsTable
        title="Snackbar.Icon props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Icon slot of Snackbar item'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />
    </Page>
    """
  end

  def component_anatomy do
    """
    <Snackbar>
      <Snackbar.Trigger>...</Snackbar.Trigger>
      <Snackbar.Icon>...</Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Header>...</Snackbar.Header>
        <Snackbar.Message>...</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>
    """
  end
end
