def values (cards)  #checked -ydaw-
    array = []
        cards.each do |card|
                case card.chr
                    when "T"
                        array.push(10)
                    when "J"
                        array.push(11)
                    when "Q"
                        array.push(12)
                    when "K"
                        array.push(13)
                    when "A"
                        array.push(14)
                    else
                        array.push(card.chr.to_i)
                 end
            end
     array
 end

 def suits (cards) #checkd -ydaw-
    array = []
        cards.each do |card|
                array.push(card[1])
            end
    array
 end

def four_of_kind (player_cards) #
  cards_values = values(player_cards)
  result = []
  cards_values.each do |item|
      if cards_values.count(item) == 4
        result << item
        result << true
        return result
      end
    end
       return false
end

def three_of_kind (player_cards) #
    cards_values = values(player_cards)
    result = []
    cards_values.each do |item|
        if cards_values.count(item) == 3
          result << item
          result << true
          return result
        end
      end
         return false
end

def one_pair (player_cards)
    cards_values = values(player_cards)
    result = []
    cards_values.each do |item|
        if cards_values.count(item) == 2
          result << item
          result << true
          return result
        end
      end
         return false
end

def full_house (player_cards)
    if one_pair(player_cards) and three_of_kind (player_cards)
       true
    else
       false
    end
end

def flush (player_cards)
    cards_suits = suits(player_cards)
    cards_suits.all? { |suit| suit == cards_suits[0]}
end

def straight (player_cards)
   cards_values = values(player_cards).sort
   str_flag = true
   (0..4).each do |i|
     if cards_values[i] + 1 != cards_values[i+1]
       str_flag = false
     end
   end
   str_flag
end

def straight_flush (player_cards)
  if straight(player_cards) and flush(player_cards)
    true
  else
    false
  end
end

def royal_flush (player_cards)
   cards_values = values(player_cards).sort
   royal_flush_array = [10,11,12,13,14]
   if flush(player_cards) and cards_values.eql?royal_flush_array
     true
   else
     false
   end
end

def two_pair (player_cards)
  cards_values = values(player_cards)
  found = 0
  result = []
  cards_values.uniq.each do |value|
    if cards_values.count(value) == 2 and found != 2
        found +=1
        result << value
    elsif found == 2
      result << true
      return result
    end
  end
     return false
end

def highest_card (player_cards)
  cards_values = values(player_cards).max
end

def take_user_input
    num_of_test_cases = gets.strip.to_i
    exit if num_of_test_cases > 1000 || num_of_test_cases < 0
    playerscards = Array.new(num_of_test_cases , "")
    (0...num_of_test_cases).each do |i|
    playerscards[i] = gets.strip.split(" ")
    end
    playerscards
end

def find_players_rank (player)
 if royal_flush(player)
   return 10
 elsif straight_flush(player)
   return 9
 elsif four_of_kind(player)
   return 8
 elsif full_house(player)
   return 7
 elsif flush(player)
   return 6
 elsif straight(player)
   return 5
 elsif three_of_kind(player)
   return 4
 elsif two_pair(player)
   return 3
 elsif var = one_pair(player)
   p var
   return 2 +var[0]/15.0
 else
   return 0
 end
end

playerscards = take_user_input
playerscards.each do |item|
    player_1 = item.slice(0..4)
    player_2 = item.slice(5..9)
    player_1_result = find_players_rank(player_1)
    player_2_result = find_players_rank(player_2)
    if  player_1_result > player_2_result
      puts "Player 1"
    elsif player_1_result < player_2_result
      puts "Player 2"
    elsif player_1_result == 0 and player_2_result == 0
       puts highest_card(player_1) > highest_card(player_2) ? "Player 1" : "Player 2"
    else
      puts "equal"
    end
  end

# test case for
  # 2H 2D 4C 4D 5S 3C 3D 3S 9S 9S \4D 9C AS AH AC 3D 6D 7D TD QD \4D 5C 5S 7H 8C 8D 9D TD JD QD \TD JD QD KD AD 8D 9D TD JD QD
  # 2H 2D 4C 7D 5S 3C 5D 2S 9S 9S
