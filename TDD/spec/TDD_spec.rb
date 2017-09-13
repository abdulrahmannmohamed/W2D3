require 'TDD'

describe Array do
  describe '#my_uniq' do
    let(:array) {[1,2,1,3,3]}
    it 'should return unique elements' do
      expect(array.my_uniq).to eq([1,2,3])
    end
  end
  describe '#two_sum' do
    let(:array) {[-1, 0, 2, -2, 1]}
    it 'should return array of indices of correct pairs' do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end
  describe '#my_transpose' do
    let(:array){[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
    it 'should return a transposed array' do
      expect(array.my_transpose).to eq(array.transpose)
    end
  end
end

describe '#stock_picker' do
  let(:prices){[1,2,1,3,0.5]}
  it 'should return most profitable pair' do
    expect(stock_picker(prices)).to eq([0, 3])
  end
end
