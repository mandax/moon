defmodule Moon.Assets.Icons.IconCurrencyBOB do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconCurrencyBOB-#{assigns[:color]}-#{assigns[:background_color]}")

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

    <svg class={{ class_name }} width="1em" height="auto" viewBox="0 0 64 47" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M0.251953 46.0001H19.772C29.948 46.0001 34.748 40.6881 34.748 33.3281C34.748 27.6961 31.996 23.4721 25.532 21.8081V21.6801C30.78 19.6321 32.38 15.5361 32.38 11.6321C32.38 4.65606 27.516 0.560059 17.468 0.560059H0.251953V46.0001ZM10.684 18.8001V9.90406H15.932C20.348 9.90406 21.756 11.6961 21.756 14.3201C21.756 17.3281 19.836 18.8001 16.508 18.8001H10.684ZM10.684 36.7201V26.9281H17.596C21.564 26.9281 23.676 28.7841 23.676 31.8561C23.676 35.0561 21.564 36.7201 17.98 36.7201H10.684Z" fill="currentColor"/> <path d="M50.416 46.5761C58.992 46.5761 63.152 42.3521 63.152 36.5281C63.152 30.3841 59.376 28.5921 52.464 26.2241C49.328 25.1361 48.176 24.4321 48.176 23.4721C48.176 22.2561 49.52 21.7441 50.672 21.7441C52.784 21.7441 55.472 22.8321 57.648 25.0081L62.384 18.0321C58.736 15.3441 55.28 14.1281 50.544 14.1281C44.016 14.1281 38.832 17.7761 38.832 24.1121C38.832 30.1281 43.44 32.6881 48.688 34.2881C52.592 35.5041 53.552 36.1441 53.552 37.1681C53.552 38.3201 52.528 39.0241 50.544 39.0241C47.664 39.0241 44.976 37.8721 42.352 35.5041L37.68 41.9681C41.136 45.0401 45.488 46.5761 50.416 46.5761Z" fill="currentColor"/> </svg>
    """
  end
end