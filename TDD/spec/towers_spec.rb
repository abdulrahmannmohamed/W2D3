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
      expect(game.stacks[2].last).to eq(disk)
    end

    it "shouldn't put a larger disk on a smaller disk" do
      game.move_disk(1, 2)
      expect { game.move_disk(1, 2) }.to raise_error("You can't put a larger disk on a smaller disk")
    end

    it "shouldn't be able to move from an empty stack" do
      expect { game.move_disk(2, 1) }.to raise_error("You can't remove from an empty stack")
    end
  end

end
