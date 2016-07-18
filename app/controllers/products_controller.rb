class ProductsController < ApplicationController
  def index
  	search = params[:search]
  	price = params[:price]
  	category = params[:category_id]

  	@products = Product.all

  	if search.present?
  		@products = Product.name_like(search)
  	end

  	if price.present?
  		@products = Product.with_price(price)
  	end

  	if category.present?
  		@products = Product.where(category_id: category)
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_index_path
  end
end
