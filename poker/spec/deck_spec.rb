require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe '#initialize' do
    it 'should create a deck with 52 cards' do
      expect(deck.deck.length).to eq(52)
    end

    it 'should contain only card objects' do
      all_cards = deck.deck.all? { |obj| obj.class == Card }
      expect(all_cards).to be(true)
    end

    it 'should have four of each value' do
      vals = (2..14).to_a
      has_all_vals = vals.all? do |val|
        deck.deck.count {|card| card.number == val} == 4
      end
      expect(has_all_vals).to be(true)
    end

    it 'should have 13 of each sign' do
      suits = [:spade, :heart, :diamond, :club]
      has_all_suits = suits.all? do |suit|
        deck.deck.count {|card| card.sign == suit} == 13
      end
      expect(has_all_suits).to be(true)
    end
  end

  describe '#take_cards' do
    it 'should take one card without an argument' do
      deck.shuffle
      card = deck.take_cards
      expect(card.first.class).to eq(Card)
      expect(deck.deck.length).to eq(51)
    end

    it 'deck should not have the taken card' do
      deck.shuffle
      cards = deck.take_cards
      expect(deck.deck.include?(cards.first)).to eq(false)
    end

    it 'should be able to take multiple cards' do
      deck.shuffle
      cards = deck.take_cards(5)
      expect(cards.length).to eq(5)
      expect(cards.all? {|el| el.is_a?(Card)} )
    end
  end

  describe '#shuffle' do
    it 'should shuffle the deck' do
      original_deck = deck.deck.dup
      deck.shuffle
      expect(original_deck).not_to eq(deck.deck)
    end
  end

end
