user1 = User.create!(
  email: 'user1@venta.com',
  password: 'testme',
  role: 'admin',
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


Labour.create(category_id: sub_category_1.id, title: "test_1")
Labour.create(category_id: sub_category_2.id, title: "test_2")
Labour.create(category_id: sub_category_3.id, title: "test_3")
Labour.create(category_id: sub_category_4.id, title: "test_4")
Labour.create(category_id: sub_category_5.id, title: "test_5")
Labour.create(category_id: sub_category_6.id, title: "test_6")
Labour.create(category_id: sub_category_7.id, title: "test_7")
Labour.create(category_id: sub_category_8.id, title: "test_8")
Labour.create(category_id: sub_category_9.id, title: "test_9")
Labour.create(category_id: sub_category_10.id, title: "test_10")
