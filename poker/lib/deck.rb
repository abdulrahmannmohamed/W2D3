require_relative 'card'

class Deck

  attr_reader :deck
  SUITS = [:spade, :heart, :diamond, :club]
  VALUES = (2..14).to_a
  def initialize
    @deck = new_deck
  end

  def new_deck
    cards = []
    SUITS.each do |suit|
      VALUES.each do |val|
        cards << Card.new(val, suit)
      end
    end
    cards
  end

  def shuffle
    @deck.shuffle!
  end

  def give_cards(n = 1)
    cards = []
    n.times { |n| cards << @deck.pop }
    cards
  end

end
