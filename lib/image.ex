defmodule Identicon.Image do
  defstruct hex: nil
end
#we can use struct anywhere in the application using the format below
# %Identicon.Image{}

# benifit of structs is that we get default properties, cant add properties other
#than the ones listed.
