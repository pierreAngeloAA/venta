user1 = User.create!(
  email: 'user1@venta.com',
  password: 'testme',
  password_confirmation: 'testme'
)

user2 = User.create!(
  email: 'user2@venta.com',
  password: 'testme',
  password_confirmation: 'testme'
)

area_1 = Category.create(name: "Metalmecania")
area_2 = Category.create(name: "Construccion")
area_3 = Category.create(name: "Mecanica")
area_4 = Category.create(name: "Electricidad")
area_5 = Category.create(name: "informatica")

category_1 = Category.create(name: "Soldadura", parent_id: area_1.id)
category_2 = Category.create(name: "estructuras", parent_id: area_1.id)

category_3 = Category.create(name: "pisos", parent_id: area_2.id)
category_4 = Category.create(name: "carpinteria", parent_id: area_2.id)

category_5 = Category.create(name: "rodamientos", parent_id: area_3.id)
category_6 = Category.create(name: "suspencion", parent_id: area_3.id)

category_7 = Category.create(name: "red electrica", parent_id: area_4.id)
category_8 = Category.create(name: "puntos electricos", parent_id: area_4.id)

category_9 = Category.create(name: "programas", parent_id: area_5.id)
category_10 = Category.create(name: "diseño wed", parent_id: area_5.id)

sub_category_1 = Category.create(name: "tic", parent_id: category_1.id)
sub_category_2 = Category.create(name: "recubrimientos", parent_id: category_2.id)
sub_category_3 = Category.create(name: "losa", parent_id: category_3.id)
sub_category_4 = Category.create(name: "puertas", parent_id: category_4.id)
sub_category_5 = Category.create(name: "lubricacion", parent_id: category_5.id)
sub_category_6 = Category.create(name: "mantenimiento", parent_id: category_6.id)
sub_category_7 = Category.create(name: "intalacion electrica", parent_id: category_7.id)
sub_category_8 = Category.create(name: "toma corriente", parent_id: category_8.id)
sub_category_9 = Category.create(name: "office", parent_id: category_9.id)
sub_category_10 = Category.create(name: "frontend", parent_id: category_10.id)


Labour.create(category_id: sub_category_1.id, description: "test_1", start_date: Date.today, end_date: Date.today + 10.days)
Labour.create(category_id: sub_category_2.id, description: "test_2", start_date: Date.today, end_date: Date.today + 20.days)
Labour.create(category_id: sub_category_3.id, description: "test_3", start_date: Date.today, end_date: Date.today + 330.days)
Labour.create(category_id: sub_category_4.id, description: "test_4", start_date: Date.today, end_date: Date.today + 10.days)
Labour.create(category_id: sub_category_5.id, description: "test_5", start_date: Date.today, end_date: Date.today + 10.days)
Labour.create(category_id: sub_category_6.id, description: "test_6", start_date: Date.today, end_date: Date.today + 2.days)
Labour.create(category_id: sub_category_7.id, description: "test_7", start_date: Date.today, end_date: Date.today + 34.days)
Labour.create(category_id: sub_category_8.id, description: "test_8", start_date: Date.today, end_date: Date.today + 15.days)
Labour.create(category_id: sub_category_9.id, description: "test_9", start_date: Date.today, end_date: Date.today + 6.days)
Labour.create(category_id: sub_category_10.id, description: "test_10", start_date: Date.today, end_date: Date.today + 8.days)