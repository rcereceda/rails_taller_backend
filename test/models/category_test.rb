require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@category = categories(:one)
  end

  test "deleting products on cascade" do 
  	@category.destroy
  	assert_empty Product.where(category:@category.id) #assert_equal 0, @category.products.count
  end

  test "discount greater than 100 is not valid" do
  	@category.discount = 101
  	assert_not @category.valid?
  end
end
