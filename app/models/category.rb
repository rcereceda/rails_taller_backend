class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy
	validates :discount, inclusion: { in: 0..100 } #:inclusion => 0..100
end
