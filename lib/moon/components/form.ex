defmodule Moon.Components.Form do
  use Moon.StatelessComponent

  prop(for, :any)
  prop(change, :string)
  prop(submit, :string)
  prop(target, :any)
  prop(autocomplete, :string, default: "on", values: ["on", "off"])
  slot(default)

  def render(assigns) do
    ~H"""
    <Surface.Components.Form for={{ @for }} change={{ @change }} submit={{ @submit }} opts={{ "phx-target": @target, autocomplete: @autocomplete }}>
      <slot />
    </Surface.Components.Form>
    """
  end
end
