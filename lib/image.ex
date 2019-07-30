defmodule Identicon.Image do
  @moduledoc """
    Provides struct that carries results from different funtions to create an identicon
  """

  defstruct hex: nil, color: nil, grid: nil, pixle_map: nil
end



#we can use struct anywhere in the application using the format below
# %Identicon.Image{}

# benifit of structs is that we get default properties, cant add properties other
#than the ones listed.

#always have to initialize property values before hand
