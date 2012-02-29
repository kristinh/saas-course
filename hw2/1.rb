class Numeric
  @@currencies = {'dollar' => 1.000, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      @dollars = self * @@currencies[singular_currency]
      self
    elsif method_id.to_s == 'in'
      singular_currency = args[0].to_s.gsub( /s$/,'')
      @dollars / @@currencies[singular_currency]
    else
      super
    end
  end
end

class String
  def palindrome?
    forward_string = self.gsub(/\W/, '').downcase
    reverse_string = forward_string.reverse
    forward_string == reverse_string
  end
end

module Enumerable
  def palindrome?
    forward = self.to_a
    reversed = Array.new
    forward.reverse_each {|item| reversed.push(item) } 
    reversed == forward 
  end
end

=begin
t = {"hello"=>"world"}
puts t.palindrome?.inspect
puts [1,2,3,2,1].palindrome?.inspect
puts [12,3,4].palindrome?.inspect
puts (1..10).palindrome?.inspect

puts "Madam, I'm Adam!".palindrome?.inspect
puts "Madamx, I'm Adam!".palindrome?.inspect
puts 2.rupee.in(:dollar)
puts 3.yen.in(:dollar)
puts 6.euro.in(:dollar)
puts 2.rupees.in(:dollars)
puts 3.yen.in(:dollars)
puts 6.euros.in(:dollars)
puts 5.rupees.in(:yen)
=end

