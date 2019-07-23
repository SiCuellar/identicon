defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def pick_color(image) do
    #pattern match to get access to first 3 properties
    %Identicon.Image{hex: [r,g,b | _tail]} = image
    # [r,g,b | _tail] = hex_list      since we arent using hex_list --> we can directly patter match to above line
    [r,g,b]
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

end
