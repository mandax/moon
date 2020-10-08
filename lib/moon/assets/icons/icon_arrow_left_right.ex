defmodule Moon.Assets.Icons.IconArrowLeftRight do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconArrowLeftRight-#{assigns[:color]}-#{assigns[:background_color]}")

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

    <svg class={{ class_name }} width="1em" height="auto" viewBox="0 0 20 10" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-arrow-left-right</title>   <desc>Created with Sketch.</desc>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Arrow-Left-Right" transform="translate(0.000000, -5.000000)" fill="currentColor">       <path d="M9.93438953,1.87681938 C10.1164856,2.05166515 10.1164856,2.33557034 9.93438953,2.51038783 C9.75238178,2.68537502 9.45714897,2.68537502 9.27511179,2.51038783 L8.25264265,1.52786319 L8.25264265,14.2981097 L7.3201767,14.2981097 L7.3201767,1.52783491 L6.29758984,2.51038783 C6.11558209,2.68537502 5.82034928,2.68537502 5.63834153,2.51038783 C5.5472788,2.42288009 5.50174743,2.30824892 5.50174743,2.19358946 C5.50174743,2.07898657 5.5472788,1.96424226 5.63834153,1.87681938 L7.45680024,0.129492965 C7.63880799,-0.0454942238 7.93401137,-0.0454942238 8.11604855,0.129492965 L9.93438953,1.87681938 Z M14.3616805,18.1196858 L12.5433396,19.8670122 C12.3613024,20.0419994 12.066099,20.0419994 11.8840913,19.8670122 L10.0656325,18.1196858 C9.97456981,18.0322629 9.92903844,17.9175186 9.92903844,17.8029157 C9.92903844,17.6882562 9.97456981,17.5736251 10.0656325,17.4861173 C10.2476403,17.3111301 10.5428731,17.3111301 10.7248809,17.4861173 L11.7474677,18.4686702 L11.7474677,5.6983954 L12.6799337,5.6983954 L12.6799337,18.468642 L13.7024028,17.4861173 C13.88444,17.3111301 14.1796728,17.3111301 14.3616805,17.4861173 C14.5437766,17.6609348 14.5437766,17.94484 14.3616805,18.1196858 Z" id="icon-arrow-left-right" transform="translate(10.000000, 9.998253) rotate(90.000000) translate(-10.000000, -9.998253) "></path>     </g>   </g> </svg>
    """
  end
end