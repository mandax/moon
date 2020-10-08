defmodule Moon.Assets.Icons.IconCopy do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name = get_class_name("Icons-IconCopy-#{assigns[:color]}-#{assigns[:background_color]}")

    false

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        
        color: {{ @color }};
        background-color: {{ @background_color }};
        display: inline-block;
        overflow: hidden;
        

        
      }
    </style>

    <svg class={{ class_name }} width="auto" height="1em" viewBox="0 0 23 28" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M5.93498 0.297897C6.12291 0.107302 6.3794 0 6.64706 0H13C15.7614 0 18 2.23858 18 5C20.7614 5 23 7.23858 23 10L23 23C23 25.7614 20.7614 28 18 28H10C7.23858 28 5 25.7614 5 23C2.23858 23 0 20.7614 0 18V6.72727C0 6.4645 0.10343 6.21228 0.287924 6.02517L5.93498 0.297897ZM16 5L16 18C16 19.6569 14.6569 21 13 21H5C3.34314 21 2 19.6569 2 18V9H8C8.55228 9 9 8.55228 9 8V2H13C14.6569 2 16 3.34315 16 5ZM7 2.06634V7H2.13544L7 2.06634ZM10 26C8.34315 26 7 24.6569 7 23H13C15.7614 23 18 20.7614 18 18V7C19.6569 7 21 8.34315 21 10L21 23C21 24.6569 19.6569 26 18 26H10Z" fill="currentColor"/> </svg>
    """
  end
end