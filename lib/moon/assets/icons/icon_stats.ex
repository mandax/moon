defmodule Moon.Assets.Icons.IconStats do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  false

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconStats-#{assigns[:color]}-#{assigns[:background_color]}")

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

    <svg class={{ class_name }} width="auto" height="1em" viewBox="0 0 16 20" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-stats</title>   <desc>Created with Sketch.</desc>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Stats" transform="translate(-2.000000, 0.000000)" fill="currentColor">       <path d="M4.32915341,16 L6.32915341,16 L6.32915341,20 L4.32915341,20 L4.32915341,16 Z M9.32915341,13 L11.3291534,13 L11.3291534,20 L9.32915341,20 L9.32915341,13 Z M16.6880511,7.27448962 C16.5599953,7.75862426 16.0674834,8.0462137 15.5889516,7.91627993 C15.1102105,7.78666693 14.8260569,7.28889477 14.9544146,6.80471614 L15.674776,4.08552487 L2.8974733,10.7945485 L2,9.22238045 L14.7773517,2.51332819 L12.0886301,1.78451691 C11.609889,1.65490392 11.3257354,1.15713175 11.4541214,0.673002744 C11.5182823,0.430824666 11.673319,0.237938542 11.8722275,0.121791143 C12.0710379,0.00570104355 12.3139163,-0.0337649317 12.5532208,0.0312124387 L17.3346584,1.32719163 C17.8133996,1.45680463 18.0975248,1.95452716 17.9691671,2.4387058 L16.6880511,7.27448962 Z M15.3291534,11 L17.3291534,11 L17.3291534,20 L15.3291534,20 L15.3291534,11 Z" id="icon-stats"></path>     </g>   </g> </svg>
    """
  end
end