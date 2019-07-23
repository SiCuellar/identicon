defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |>
    Enum.chunk(3)
  end

  #pattern match to get access to first 3 properties
  # [r,g,b | _tail] = hex_list      since we arent using hex_list --> we can directly patter match
  def pick_color(image) do
    %Identicon.Image{hex: [r,g,b | _tail]} = image
    %Identicon.Image{image | color: {r,g,b}}
  end

  # def pick_color(%Identicon.Image{hex: [r,g,b | _tail]} = image) do
  #   %Identicon.Image{image | color: {r,g,b}}
  # end
  # we can directy patter match in teh fucntion input






  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

end
