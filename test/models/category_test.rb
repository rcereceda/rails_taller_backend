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
  	assert_empty Product.where(category:@category.id)
  end
end
