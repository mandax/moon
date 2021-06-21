defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  alias Surface.Components.Form.TextInput
  alias Moon.Components.Label
  alias Moon.Assets.Icon

  prop(field, :atom)
  prop(label, :string)

  prop(type, :string,
    default: "text",
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "url",
      "time",
      "url"
    ]
  )

  prop(value, :string)
  prop(placeholder, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(left_icon, :string)
  prop(right_icon, :string)
  prop(right_icon_click, :event)
  prop(class, :string)
  prop(without_design, :boolean)
  prop(on_focus, :event)
  prop(on_blur, :event)

  def render(assigns) do
    ~F"""
    <div class="relative">
      {asset_import @socket, "js/components/text-input"}

      <Icon name={@left_icon} :if={@left_icon} class="absolute z-10 top-3 left-5" />
      <Icon name={@right_icon} click={@right_icon_click} :if={@right_icon} class="absolute z-10 top-3 right-5" />

      <TextInput
        class={"#{!@without_design && "moon-text-input"} #{@class} #{@left_icon && "pl-12"} #{@right_icon && "pr-12"} relative z-0"}
        field={@field}
        opts={
          [
            placeholder: @placeholder,
            disabled: @disabled,
            "data-error": @error && "true",
            "data-rounded": @rounded && "true"
          ]
        }
        value={@value}
        focus={@on_focus}
        blur={@on_blur}
        :if={!@label}
      />

      <Label text={@label} :if={@label}>
        <TextInput
          class={"moon-text-input mt-2 #{@left_icon && "pl-12"} #{@right_icon && "pr-12"} relative z-0"}
          field={@field}
          opts={[
            placeholder: @placeholder,
            disabled: @disabled,
            "data-error": @error && "true",
            "data-rounded": @rounded && "true"
          ]}
          focus={@on_focus}
          blur={@on_blur}
          value={@value}
        />
      </Label>
    </div>
    """
  end
end
