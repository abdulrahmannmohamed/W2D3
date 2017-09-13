class Towers_of_hanoi

  attr_accessor :stacks

  def initialize
    @stacks = { 1 => [1,2,3], 2 => [], 3 => [] }
  end

  def move_disk(start_idx, end_idx)
    @stacks[end_idx] = @stacks[start_idx].pop
  end

end
