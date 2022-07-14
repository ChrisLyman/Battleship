class Board

  attr_reader :size

  def initialize(size)
    @size = size
    @letters_array = ("A".."Z").to_a
    @cells = create_cells
  end

  def create_cells
    hash = {}

    @letters_array.first(@size).each do |letter|
      @cell_counter = 0
      @size.times do
        @cell_counter += 1
        if hash[letter + "#{@cell_counter}"].nil?
          hash[letter + "#{@cell_counter}"] = Cell.new(letter + "#{@cell_counter}")
        end
      end
    end
    hash
  end

  def valid_coordinate?(coordinate)
    !@cells[coordinate].nil?
  end

  def valid_placement?(ship, coordinates)
    coordinates.size == ship.length
  end
end
