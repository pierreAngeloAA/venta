# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
area_1 = Category.create(name: "Metalmecania")
area_2 = Category.create(name: "Construccion")
area_3 = Category.create(name: "Mecanica")
area_3 = Category.create(name: "Electricidad")

category_1 = Category.create(name: "acero convencional", parent_id: area_1.id)
category_2 = Category.create(name: "acero estructural", parent_id: area_1.id)

category_3 = Category.create(name: "preparacion de terreno", parent_id: area_2.id)
category_4 = Category.create(name: "pisos", parent_id: area_2.id)

sub_category_1 = Category.create(name: "soldadura", parent_id: category_1.id)
sub_category_2 = Category.create(name: "recubrimientos", parent_id: category_1.id)

sub_category_3 = Category.create(name: "soldadura estructural", parent_id: category_2.id)
sub_category_4 = Category.create(name: "diseños", parent_id: category_2.id)


Labour.create(category_id: category_1.id, description: "test_1", start_date: Date.today, end_date: Date.today + 30.days)
Labour.create(category_id: category_2.id, description: "test_2", start_date: Date.today, end_date: Date.today + 30.days)

Labour.create(category_id: sub_category_1.id, description: "test_3", start_date: Date.today, end_date: Date.today + 30.days)
Labour.create(category_id: sub_category_2.id, description: "test_4", start_date: Date.today, end_date: Date.today + 30.days)