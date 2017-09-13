require 'card'

describe Class do
  subject(:card) { Card.new(2, :spade)}
  describe '#initialize' do
    it 'should set a value for a number and sign' do
      expect(card.number).to eq(2)
      expect(card.sign).to eq(:spade)
    end
  end
end
