defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)

  end
  # &mirror_row/1 --> to pass a reference to function 

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end
  #  ++ Joins list together

  #pattern match to get access to first 3 properties
  # [r,g,b | _tail] = hex_list      since we arent using hex_list --> we cadirectly patter match
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
