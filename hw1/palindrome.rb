
def palindrome?(string)

  return false if string.nil?

  forward_string = string.gsub(/\W/, '')
  forward_string.downcase!
  reverse_string = forward_string.reverse
  reverse_string == forward_string

end
