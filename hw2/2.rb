class CartesianProduct
  include Enumerable
  def initialize(a,b)
    a.inject(Array.new) { |product, a_val| 
      b.each { |b_val| product.push([a_val,b_val]) }
    }
  end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)
