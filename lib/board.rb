require './lib/cell'
class Board

  attr_reader :size,
              :cells

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
    coordinates.size == ship.length && valid_cell_coordinates?(coordinates)
  end

  def coordinate_hash(coordinates)
    hash = Hash.new { |k,v| k[v] = []}
    coordinates.each do |coord|
      hash[:letter] << coord[0]
      hash[:number] << coord[1]
    end
    hash
  end

  # def valid_consecutive_placement?(ship, coordinates)
  #    valid_consecutive_number?(coordinates)
  #    valid_consecutive_letter?(coordinates)
  # end

  def valid_consecutive_number?(coordinates)
    coordinate_hash(coordinates)[:number].each_cons(2).all? do |num_1, num_2|
      num_1.to_i == num_2.to_i - 1
    end
  end

  def valid_consecutive_letter?(coordinates)
    coordinate_hash(coordinates)[:letter].each_cons(2).all? do |letter_1, letter_2|
      letter_1.ord == letter_2.ord - 1
    end
  end

  def valid_cell_coordinates?(coordinates)
    return false unless valid_empty_coordinates?(coordinates)
    return true if valid_consecutive_number?(coordinates) && valid_duplicate_letters?(coordinates)
    return true if valid_consecutive_letter?(coordinates) && valid_duplicate_numbers?(coordinates)
    false
  end

  def valid_duplicate_numbers?(coordinates)
    coordinate_hash(coordinates)[:number].each_cons(2).all? do |num_1, num_2|
      num_1.to_i == num_2.to_i
    end
  end

  def valid_duplicate_letters?(coordinates)
    coordinate_hash(coordinates)[:letter].each_cons(2).all? do |letter_1, letter_2|
      letter_1.ord == letter_2.ord
    end
  end

  def valid_empty_coordinates?(coordinates)
    coordinates.all? do |coord|
      @cells[coord].empty?
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coord|
        @cells[coord].place_ship(ship)
      end
      "OK"
    else
      "fail"
    end
  end

  def render
require "pry"; binding.pry
  end
end
