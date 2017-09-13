class Towers_of_hanoi

  attr_accessor :stacks

  def initialize
    @stacks = { 1 => [3, 2, 1], 2 => [], 3 => [] }
  end

  def move_disk(start_idx, end_idx)
    raise "You can't remove from an empty stack" if @stacks[start_idx].empty?
    unless @stacks[end_idx].empty?
      if @stacks[end_idx].last < @stacks[start_idx].last
        raise "You can't put a larger disk on a smaller disk"
      end
    end
    @stacks[end_idx] << @stacks[start_idx].pop
  end

end
