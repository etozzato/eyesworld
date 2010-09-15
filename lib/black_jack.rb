  CARDS = %w(A 2 3 4 5 6 7 8 9 T J Q K)
  FACES = %w(H C D S)
  DECKS = 3
  
=begin
  
  GAME [ Deack, Dealer, Players ]
  
=end

class Game
  def initialize()
    @deck = Deck.new(3)
    @dealer = Dealer.new
    @players = inject({}) {Player.new}
  end
end  
  
class Deck
  
  def initialize(number_of_decks = 1)
    @cards = []

    number_of_decks.times do
      CARDS.each do |card|
        FACES.each do |face|
          @cards << "#{card}#{face}"
        end
      end
    end
    
    5.times do shuffle end
  end

  def deal
    initialize unless @cards.size > 0
    return @cards.pop
  end

  private
  
  def shuffle
    @cards = @cards.sort_by { rand }
  end
  
end

@hand   = []
@score  = 0

class Dealer
  def initialize(deck)
    @hand   = []
    @score  = 0
    @deck = deck
    return true
  end

  def bust?
    current_score > 21
  end

  def natural?
    current_score == 21 && @hand.length == 2
  end

  def current_score

    # To deal with multiple aces, sort the current hand so that the
    # aces appear as the last elements in the array.
    values = []
    sortable_hand = @hand.sort { |x,y| x.gsub('A','Z') <=> y.gsub('A','Z')}
    #sortable_hand = @hand.collect { |x| x == 'A' ? 'Z' : x }
    
    sortable_hand.each {|card| values << card.at(0)}
    not_aces = values.find_all {|v| /[^A]/=~v}
    aces = values.find_all {|v| /[A]/=~v}

    values = not_aces + aces

    # Calculate the score for this hand
    score = 0
    values.each do |value|
      if /\d/ =~ value then score += value.to_i end
      if /[T,K,J,Q]/ =~ value then score += 10 end
      if /[A]/ =~ value then
        if score + 11 > 21
          score += 1
        elsif
         score += 11
        end
      end
     end
     score
   end

   def start
     @hand = []
     @hand << @deck.deal << @deck.deal
     return "#{@hand.at(0)} XX"
   end

   def continue
     until self.bust? || current_score >= 17
       card = @deck.deal
       @hand << card
     end

     if self.bust?
       result = "#{@hand.join(' ')} - Bust: #{current_score}"
       @hand = []
     elsif self.natural?
       result = "#{@hand.join(' ')} - Black Jack"
       @hand = []
     else
       result = "#{@hand.join(' ')} - #{current_score}"
       @hand = []
     end
     return result
   end
end