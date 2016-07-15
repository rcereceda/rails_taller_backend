class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy
	validates :discount, :inclusion => 0..100
end
