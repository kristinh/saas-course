def combine_anagrams(words)
  return [] if words.nil?
  return [] if !words.is_a?(Array)

  anagrams_hash = words.inject(Hash.new) { |anagrams, word| 
    a = word.downcase.split(//).sort.join
    if anagrams[a].nil?
      anagrams[a] = [word]
    else
      anagrams[a].push(word)
    end
    anagrams 
  } 
  anagrams_hash.values
end

=begin
words = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 
'scream'] 
puts combine_anagrams(words).inspect
=end
