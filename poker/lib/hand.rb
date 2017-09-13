class Hand

  attr_reader :cards

  def initialize(*cards)
    @cards = []
    @cards += cards
  end

  def take_cards(deck, num = 1)
    @cards += deck.give_cards(num)
  end

  def discard(card)
    @cards.delete(card)
  end

  def high_card
    @cards.max_by{|card| card.value}.value
  end

  def pair
    card_values.each do |card_val|
      if card_values.count(card_val) == 2
        return card_val
      end
    end
    nil
  end

  def two_pair
    pairs = []
    card_values.each do |card_val|
      pairs << card_val if card_values.count(card_val) == 2
    end
    return pairs.max if pairs.length == 4
    nil
  end

  def three_of_a_kind
    card_values.each do |card_val|
      return card_val if card_values.count(card_val) == 3
    end
    nil
  end

  def four_of_a_kind
    card_values.each do |card_val|
      return card_val if card_values.count(card_val) == 4
    end
    nil
  end

  def full_house
    if pair && three_of_a_kind
      return three_of_a_kind
    end
    nil
  end

  def card_values
    @cards.map {|card| card.value}
  end

  def card_suits
    @cards.map {|card| card.sign}
  end

  def flush
    return high_card if card_suits.all? {|card_suit| card_suit == card_suits.first}
    nil
  end


end
