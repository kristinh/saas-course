class CartesianProduct
  include Enumerable
  def initialize(a,b)
    @product = a.inject(Array.new) { |product, a_val| 
      b.each { |b_val| product.push([a_val, b_val]) }
      product
    }
  end

  def each(&block)
    @product.each(&block)
  end

  def [](key)
    if key.kind_of?(Integer)
      return @product[key]
    else
      return nil
    end
  end
  
end

=begin
c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
puts c.inspect
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)
=end
