def count_word(string)

  return nil if string.nil?

  string_array = string.downcase.scan(/\w+/)
  string_array.inject(Hash.new) { |count, word|
    count[word].nil? ? count[word] = 1 : count[word] += 1
    count
  }

end

string = "A man, a plan, a canal -- Panama"
puts count_word(string).inspect
