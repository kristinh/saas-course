class Dessert
  attr_accessor :name
  attr_accessor :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end

  def inspect
    "Dessert '#{name}' '#{calories}'" 
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end

  def delicious?
     !(flavor == "black licorice")
  end

  def inspect
    "Dessert '#{name}' '#{calories}' '#{flavor}'"
  end
end
