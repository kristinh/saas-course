class Numeric
  @@currencies = {'dollar' => 1.000, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args)
    if method_id.to_s == 'in'
      singular_currency = args[0].to_s.gsub( /s$/, '')
      if @@currencies.has_key?(singular_currency)
        self * @@currencies[singular_currency] / @@currencies[@currency]
      else
        super
      end
    else
      singular_currency = method_id.to_s.gsub( /s$/, '')
      if @@currencies.has_key?(singular_currency)
        @currency = singular_currency
        self
      else 
        super
      end
    end
  end
end

class String
  def palindrome?
    forward_string = self.gsub(/\W/, '').downcase
    reverse_string = forward_string.reverse
    reverse_string == forward_string
  end
end

module Enumerable
  def palindrome?
    reversed = self.reverse
    self == reversed
  end
end
