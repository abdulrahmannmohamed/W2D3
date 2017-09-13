require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }

  describe '#initialize' do
    it 'expects hand context an empty array' do
      expect(hand.cards).to eq([])
    end
  end

  describe '#take_cards' do
    let(:deck) { double("deck") }

    it 'expects to take 1 card without an argument' do
      allow(deck).to receive(:give_cards).and_return(['a'])
      hand.take_cards(deck)
      expect(hand.cards.length).to eq(1)
      expect(hand.cards.first).to eq('a')
    end

    it 'expects to take 5 cards with 5 as an argument' do
      allow(deck).to receive(:give_cards).with(5).and_return(['a', 'b', 'c', 'd', 'e'])
      hand.take_cards(deck, 5)
      expect(hand.cards.length).to eq(5)
      expect(hand.cards).to eq(['a', 'b', 'c', 'd', 'e'])
    end
  end

  describe '#discard' do
    let(:deck) { double("deck") }
    it 'should discard the cards in hand' do
      allow(deck).to receive(:give_cards).with(5).and_return(['a', 'b', 'c', 'd', 'e'])
      hand.take_cards(deck,5)

      hand.discard('a')
      expect(hand.cards.length).to eq(4)
      expect(hand.cards.first).to eq('b')
    end
  end

  describe '#high_card' do
    let(:card1){double('card', value: 3)}
    let(:card2){double('card', value: 4)}
    let(:card3){double('card', value: 5)}
    let(:card4){double('card', value: 6)}
    let(:card5){double('card', value: 7)}
    let(:hand){Hand.new(card1, card2, card3, card4, card5)}
    it 'should return value of high card' do
      expect(hand.high_card).to eq(7)
    end
  end

  describe '#pair' do
    let(:card1){double('card', value: 3)}
    let(:card2){double('card', value: 3)}
    let(:card3){double('card', value: 4)}
    let(:card4){double('card', value: 6)}
    let(:card5){double('card', value: 6)}
    let(:hand){ Hand.new(card1, card2, card3, card4, card5) }

    it 'should return card value of first pair' do
      expect(hand.pair).to eq(3)
    end

  end

  describe '#two_pair' do
    let(:card1){double('card', value: 3)}
    let(:card2){double('card', value: 3)}
    let(:card3){double('card', value: 4)}
    let(:card4){double('card', value: 6)}
    let(:card5){double('card', value: 6)}
    let(:hand){ Hand.new(card1, card2, card3, card4, card5) }

    it 'should return card value of highest pair' do
      expect(hand.two_pair).to eq(6)
    end
  end

  describe '#three_of_a_kind' do
    let(:card1){double('card', value: 3)}
    let(:card2){double('card', value: 3)}
    let(:card3){double('card', value: 3)}
    let(:card4){double('card', value: 6)}
    let(:card5){double('card', value: 6)}
    let(:hand){ Hand.new(card1, card2, card3, card4, card5) }

    it 'should return card value of three of a kind' do
      expect(hand.three_of_a_kind).to eq(3)
    end
  end

  describe '#four_of_a_kind' do
    let(:card1){double('card', value: 3)}
    let(:card2){double('card', value: 3)}
    let(:card3){double('card', value: 3)}
    let(:card4){double('card', value: 6)}
    let(:card5){double('card', value: 6)}
    let(:hand){ Hand.new(card1, card2, card3, card4, card5) }

    it 'should return card value of four of a kind' do
      expect(hand.three_of_a_kind).to eq(3)
    end
  end

  describe '#four_of_a_kind' do
    let(:card1){double('card', value: 5)}
    let(:card2){double('card', value: 5)}
    let(:card3){double('card', value: 5)}
    let(:card4){double('card', value: 5)}
    let(:card5){double('card', value: 6)}
    let(:hand){ Hand.new(card1, card2, card3, card4, card5) }

    it 'should return card value of four of a kind' do
      expect(hand.four_of_a_kind).to eq(5)
    end
  end

  describe '#full_house' do
    let(:card1){double('card', value: 5)}
    let(:card2){double('card', value: 5)}
    let(:card3){double('card', value: 5)}
    let(:card4){double('card', value: 6)}
    let(:card5){double('card', value: 6)}
    let(:hand){ Hand.new(card1, card2, card3, card4, card5) }

    it 'should return high card of a full house' do
      expect(hand.full_house).to eq(5)
    end
  end

  describe '#flush' do
    let(:card1){double('card', sign: :heart, value: 5)}
    let(:card2){double('card', sign: :heart, value: 4)}
    let(:card3){double('card', sign: :heart, value: 3)}
    let(:card4){double('card', sign: :heart, value: 7)}
    let(:card5){double('card', sign: :heart, value: 2)}
    let(:hand){ Hand.new(card1, card2, card3, card4, card5) }

    it 'should return high card of a flush' do
      expect(hand.flush).to eq(7)
    end

  end
  describe '#straight' do
    let(:card1){double('card', value: 5)}
    let(:card2){double('card', value: 4)}
    let(:card3){double('card', value: 3)}
    let(:card4){double('card', value: 6)}
    let(:card5){double('card', value: 2)}
    let(:hand){ Hand.new(card1, card2, card3, card4, card5) }

    it 'should return high card of a full house' do
      expect(hand.straight).to eq(6)
    end

  end




end

# initialize

# take_cards(num)

# find_sets - returns type of set as symbol

# all should output array of cards
  # high card
  # pair
  # two pair
  # three of a kind
  # full house: pair + three of a kind
  # four of a kind
  # flush - all same suit
  # straight - all 5 cards in order
  # straight flush - all 5 cards in order + flush
  # royal flush - 10 to A straight with flush
