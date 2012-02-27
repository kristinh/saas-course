def palindrome?(string)
  return false if string.nil?

  forward_string = string.gsub(/\W/, '')
  forward_string.downcase!
  reverse_string = forward_string.reverse
  reverse_string == forward_string
end

def count_words(string)
  return nil if string.nil?

  string_array = string.downcase.scan(/\w+/)
  string_array.inject(Hash.new) { |count, word|
    count[word].nil? ? count[word] = 1 : count[word] += 1
    count
  }
end

=begin
string = "A man, a plan, a canal -- Panama"
puts count_word(string).inspect
=end
