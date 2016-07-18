class Product < ActiveRecord::Base
  belongs_to :category
	validates :category_id, presence: true
	validates :price, numericality: { greater_than: 0 }
	before_save :default_values
	after_destroy :delete_category_if_last

	scope :premiums, -> { where(premium: true) }
	scope :last_5, -> { order(:id => :desc).limit(5) } # order('created_at DESC')
	scope :last_n, ->(n) { order(:id => :desc).limit(n) }
	#scope :tipo, ->(name) { where(animal_type_id: AnimalType.where("nombre = ?", name).take.id) }
	scope :name_like, ->(name) { where('name LIKE ?', "%#{name}%") }
	scope :with_price, ->(p) { where(price: p) }
	
	def default_values
		self.premium = false if self.premium.nil?
	end

	def delete_category_if_last
		if self.category.products.size <= 0 # self puede ser implicito
			self.category.destroy
		end
	end

	def price_with_discount
		new_price = self.price - (self.price * self.category.discount / 100.0) # self puede ser implicito
		new_price.to_i
	end

	# Si el producto tubiera descuento se usa el del producto, es mandatorio
	# def my_discount
	# 	self.discount || self.category.discount
	# end
end
