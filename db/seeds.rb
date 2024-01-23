# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
category_1 = Category.create(name: "soldadura")
category_2 = Category.create(name: "tuberias")
sub_category_1 = Category.create(name: "acero convencional", parent_id: category_1.id)
sub_category_2 = Category.create(name: "acero inoxidable", parent_id: category_1.id)
sub_category_3 = Category.create(name: "tuberias sanitarias", parent_id: category_2.id)
sub_category_4 = Category.create(name: "tuberias de desague", parent_id: category_2.id)