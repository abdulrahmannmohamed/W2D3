require 'rspec'
require 'towers_of_hanoi'

describe '#Towers_of_hanoi' do
  let (:game) { Towers_of_hanoi.new }

  describe '#initialize' do
    it 'stacks should contain 3 stacks' do
      expect(game.stacks.length).to eq(3)
    end

    it 'stacks should have three disks' do
      expect(game.stacks[1].length).to eq(3)
    end

    it 'second and third stacks should be empty' do
      expect(game.stacks[2].length).to eq(0)
      expect(game.stacks[3].length).to eq(0)
    end
  end

  describe '#move_disk' do
    it 'should move to last disk of new stack' do
      disk = game.stacks[1].last
      game.move_disk(1, 2)
      expect(game.stacks[2]).to eq(disk)
    end

  end

end
