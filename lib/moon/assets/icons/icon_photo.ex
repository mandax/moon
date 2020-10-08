defmodule Moon.Assets.Icons.IconPhoto do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconPhoto-#{assigns[:color]}-#{assigns[:background_color]}")

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

    <svg class={{ class_name }} width="1em" height="1em" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M14 10C10.6863 10 8 12.6863 8 16C8 19.3137 10.6863 22 14 22C17.3137 22 20 19.3137 20 16C20 12.6863 17.3137 10 14 10ZM10 16C10 13.7909 11.7909 12 14 12C16.2091 12 18 13.7909 18 16C18 18.2091 16.2091 20 14 20C11.7909 20 10 18.2091 10 16Z" fill="currentColor"/>  <path fill-rule="evenodd" clip-rule="evenodd" d="M28 23V10.7082C28 8.10796 25.8921 6.00002 23.2918 6.00002C22.266 6.00002 21.3283 5.42046 20.8695 4.50296L20 2.76394C19.153 1.07003 17.4217 1.88496e-05 15.5279 1.16739e-05L12.4722 0C10.5783 -7.13912e-06 8.84696 1.07001 8 2.76393L7.1305 4.50293C6.67175 5.42043 5.734 5.99999 4.70821 5.99999C2.10794 5.99999 0 8.10792 0 10.7082V23C0 25.7614 2.23858 28 5 28L23 28C25.7614 28 28 25.7614 28 23ZM26 10.7082V23C26 24.6568 24.6569 26 23 26L5 26C3.34315 26 2 24.6568 2 23L2 10.7082C2 9.21249 3.21251 7.99999 4.70821 7.99999C6.49154 7.99999 8.12182 6.99242 8.91935 5.39736L9.78885 3.65836C10.297 2.642 11.3358 2 12.4721 2L15.5279 2.00001C16.6642 2.00002 17.703 2.64202 18.2111 3.65837L19.0807 5.39739C19.8782 6.99245 21.5085 8.00002 23.2918 8.00002C24.7875 8.00002 26 9.21253 26 10.7082Z" fill="currentColor"/> </svg>
    """
  end
end