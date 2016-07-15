class Product < ActiveRecord::Base
  belongs_to :category
	validates :price, :category_id, presence: true
	before_save :default_values
	after_destroy :delete_category_if_last

	scope :premiums, -> { where(:premium => true) }
	scope :last_5, -> { order(:id => :desc).limit(5) }
	scope :last_n, ->(n) { order(:id => :desc).limit(n) }
	#scope :tipo, ->(name) { where(animal_type_id: AnimalType.where("nombre = ?", name).take.id) }
	
	def default_values
		self.premium = false if self.premium.nil?
	end

	def delete_category_if_last
		if self.category.products.size <= 0
			self.category.destroy
		end
	end

	def price_with_discount
		self.price * self.category.discount / 100
	end
end
