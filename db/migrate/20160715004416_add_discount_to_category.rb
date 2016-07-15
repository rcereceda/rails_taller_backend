class AddDiscountToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :discount, :integer
  end
end
