defmodule Moon.Assets.Icons.IconStarFlag do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconStarFlag-#{assigns[:color]}-#{assigns[:background_color]}")

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

    <svg class={{ class_name }} width="1em" height="1em" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M2 0H22V24L12 21L2 24V0Z" fill="currentColor"/> <path d="M10.7049 9.12113C10.6564 9.32077 10.511 9.42058 10.317 9.47049C9.49285 9.5204 8.86258 9.62022 8.37775 9.72004C8.03838 9.76995 7.89293 10.2191 8.08686 10.4687C8.42624 10.8679 8.86258 11.4169 9.49285 11.916C9.63829 12.0158 9.73526 12.2155 9.68678 12.4151C9.58981 12.8643 9.39588 13.6628 9.29892 14.4614C9.25044 14.8108 9.63829 15.0603 9.92919 14.9605C10.5595 14.7109 11.4806 14.2618 11.9654 13.8625C12.4503 14.2618 13.4199 14.661 14.0017 14.9605C14.3411 15.1102 14.6805 14.8108 14.632 14.4614C14.5835 13.6628 14.3896 12.8643 14.2441 12.4151C14.1956 12.2155 14.2441 12.0158 14.438 11.916C15.0198 11.4669 15.5047 10.8679 15.844 10.4687C16.1349 10.2191 15.9895 9.81986 15.6501 9.72004C15.2138 9.62022 14.535 9.5204 13.7108 9.47049C13.5169 9.47049 13.3714 9.32077 13.2745 9.17104C13.1775 8.72186 12.8866 7.97322 12.4503 7.22459C12.2563 6.92514 11.82 6.92514 11.6261 7.22459C11.3352 7.67377 10.9473 8.42241 10.7049 9.12113Z" fill="white"/> </svg>
    """
  end
end