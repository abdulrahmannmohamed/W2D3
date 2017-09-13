require 'TDD'

describe Array do
  describe '#my_uniq' do
    it 'should return unique elements' do
      array = [1,2,1,3,3]
      expect(array.my_uniq).to eq([1,2,3])

      array = [2, 2, 1, 1, 1, 1, 0]
      expect(array.my_uniq).to eq([2, 1, 0])
    end
  end
  describe '#two_sum' do
    it 'should return array of indices of correct pairs' do
      array = [-1, 0, 2, -2, 1]
      expect(array.two_sum).to eq([[0, 4], [2, 3]])

      array = [2, -2, 1, 1, 0, -1, 0]
      expect(array.two_sum).to eq([[0, 1], [2, 5], [3, 5], [4, 6]])
    end
  end
  describe '#my_transpose' do
    it 'should return a transposed array' do
      array = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
      expect(array.my_transpose).to eq(array.transpose)
      expect(array.transpose.my_transpose).to eq(array)
    end
  end
end

describe '#stock_picker' do
  it 'should return most profitable pair' do
    prices = [1, 2, 1, 3, 0]
    expect(stock_picker(prices)).to eq([0, 3])
  end
  it 'should return nil if no profits are possible' do
    prices = [5, 4, 3, 2, 1]
    expect(stock_picker(prices)).to eq(nil)
  end
end
