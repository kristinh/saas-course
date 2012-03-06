class Numeric
  @@currencies = {'dollar' => 1.000, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args)
    puts method_id.to_s
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

