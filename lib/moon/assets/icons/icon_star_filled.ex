defmodule Moon.Assets.Icons.IconStarFilled do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconStarFilled-#{assigns[:color]}-#{assigns[:background_color]}")

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

    <svg class={{ class_name }} width="1em" height="auto" viewBox="0 0 29 28" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M11.4492 2.05582C12.474 -0.408059 15.9644 -0.408047 16.9891 2.05583L19.1699 7.29907C19.3139 7.6453 19.6395 7.88187 20.0133 7.91184L25.6739 8.36564C28.3338 8.57889 29.4124 11.8984 27.3858 13.6344L23.0731 17.3287C22.7883 17.5727 22.6639 17.9555 22.7509 18.3202L24.0685 23.8439C24.6877 26.4396 21.8639 28.4912 19.5866 27.1002L14.7404 24.1402C14.4204 23.9447 14.0179 23.9447 13.6979 24.1402L8.85173 27.1002C6.57443 28.4912 3.75068 26.4396 4.36984 23.8439L5.68745 18.3202C5.77446 17.9555 5.65009 17.5727 5.3653 17.3287L1.05258 13.6344C-0.974038 11.8984 0.104552 8.57889 2.76451 8.36564L8.42503 7.91184C8.79882 7.88187 9.12443 7.6453 9.26844 7.29907L11.4492 2.05582Z" fill="currentColor"/> </svg>
    """
  end
end