class NoCurrencyConversion < StandardError
end

class Numeric
  @@currencies = {'dollar' => 1.000, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args)
    if method_id.to_s == 'in'
        convert(args[0])
    else
      begin
        convert(method_id)
      rescue NoCurrencyConversion
        super
      end
    end  
  end

  private
  def convert(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      raise NoCurrencyConversion
    end
  end

end

puts 5.euros.in(:rupees).inspect
