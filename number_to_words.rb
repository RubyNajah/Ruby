def take_user_input
 test_cases = gets.strip.to_i
  input_numbers = Array.new(test_cases,0)
 input_numbers.each_with_index do |item,index|
  input_numbers[index] = gets.strip.to_i
 end
  input_numbers
end

def slice_number numbers_array
  result_num = ""
 numbers_array.each do |item|
  while  item != 0
    result_num.prepend(print_words((item%1000).to_s))
    item /= 1000
  end
  puts result_num
  result_num = ""
 end
end

def print_words(number)
  number_in_words = ""
 case number.length
  when 3
    number_in_words += number_to_words(number[0].to_i) +" Hundred "
    if number[1].to_i == 1
      number_in_words += number_to_words((number[1]+number[2]).to_i)
    else
      number_in_words += number_to_words(number[1].to_i*10) +" "+ number_to_words(number[2].to_i)
    end
  when 2
    if number[0].to_i == 1
      number_in_words += number_to_words((number[0]+number[1]).to_i)
    else
      number_in_words += number_to_words(number[0].to_i*10) +" "+ number_to_words(number[0].to_i)
    end
  when 1
    number_in_words += number_to_words(number[0].to_i)
 end
end

def number_to_words (number)
 case number
  when 1
   "One"
  when 2
   "Two"
  when 3
   "Three"
  when 4
   "Four"
  when 5
   "Five"
  when 6
   "Six"
  when 7
   "Seven"
  when 8
   "Eight"
  when 9
   "Nine"
  when 10
   "Ten"
  when 11
   "Eleven"
  when 12
   "Twelve"
  when 13
   "Thirteen"
  when 14
   "Fourteen"
  when 15
   "Fifteen"
  when 16
   "Sixteen"
  when 17
   "Seventeen"
  when 18
   "Eighteen"
  when 19
   "Ninteen"
  when 20
   "Twenty"
  when 30
   "Thirty"
  when 40
   "Fourty"
  when 50
   "Fifty"
  when 60
   "Sixty"
  when 70
   "Seventy"
  when 80
   "Eighty"
  when 90
   "Ninty"
 else
   ""
 end
end

 slice_number take_user_input
