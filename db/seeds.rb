# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Product.destroy_all
Category.destroy_all

categories = Category.create([{ name: 'Tecnología', discount: 10 }, { name: 'Dormitorio', discount: 25 }, { name: 'Deportes', discount: 5 }])

category01 = Category.where(name:'Tecnología').take
category02 = Category.where(name:'Dormitorio').take
category03 = Category.where(name:'Deportes').take

category01.products.build(name: 'iPhone 6S', price: 500000, premium: true).save
category01.products.build(name: 'Macbook Pro', price: 599000, premium: true).save
category02.products.build(name: 'Frazada', price: 19990, premium: false).save
category02.products.build(name: 'Almohada', price: 5990, premium: false).save
category03.products.build(name: 'Bicicleta', price: 195000, premium: false).save
category03.products.build(name: 'Balón', price: 15900, premium: false).save