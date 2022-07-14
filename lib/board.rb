class Board

  attr_reader :size

  def initialize(size)
    @size = size
    @letters_array = ("A".."Z").to_a
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

end
