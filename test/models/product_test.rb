require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@product = products(:one)
  end

  test "product must have price" do
  	@product.price = nil
  	assert_not @product.valid?, "El producto debe tener precio"
  end

	test "product has category" do
		@product.category = nil
		assert_not @product.valid?, "El producto debe tener categoría"
	end

	test "product has premium with default value" do
		p = Product.new(name: 'Celular', category_id: 1)
		assert_not p.premium?, "El producto debe tener el campo premium en false por defecto"
	end

	test "includes premiums products" do
		assert_not Product.premiums.find { |p| p.premium = false } , "El scope debe devolver sólo los productos premiums"
	end
end
