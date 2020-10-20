defmodule Moon.Components.Select do
  use Moon.StatelessComponent

  import Moon.Utils.Rem

  alias Moon.Components.Label

  prop(field, :atom)
  prop(label, :string)
  prop(options, :any, default: [])
  prop(value, :any)
  prop(prompt, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(flex, :boolean)
  prop(input_grow, :boolean)
  prop(icon, :string)
  prop(full_width, :boolean)

  def style(%{full_width: _full_width, icon: icon, error: error}, %Moon.Theme{} = theme) do
    Moon.Components.TextInput.style(%{icon: icon, error: error, rounded: false}, theme) ++
      [
        %{
          color: theme.color.trunks_100,
          border_radius: rem(theme.radius.largest),
          "&:hover:enabled, &:focus:enabled": %{
            cursor: "pointer"
          }
        }
      ]
  end

  def render(assigns) do
    class_name =
      get_class_name("text-input-#{assigns.full_width}-#{assigns.icon}-#{assigns.error}")

    options_with_selected =
      Enum.map(assigns.options, fn row ->
        [
          key: row[:key],
          value: row[:value],
          selected: row[:value] == assigns.value,
          disabled: row[:disabled]
        ]
      end)

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        {{ style(assigns, theme) |> get_css_for_maps(".#{class_name}") }}
      </style>

      <Surface.Components.Form.Select
        class={{ class_name }}
        field={{ @field }}
        options={{ options_with_selected }}
        opts={{ [prompt: @prompt] }}
        :if={{ !@label }}
      />

      <Label text={{ @label }} :if={{ @label }}>
        <Surface.Components.Form.Select
          class={{ class_name }}
          field={{ @field }}
          options={{ options_with_selected }}
          opts={{ [prompt: @prompt] }}
        />
      </Label>
    </Context>
    """
  end
end