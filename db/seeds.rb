User.create!(
  email: 'alex@docketwise.co',
  password: '1045717291',
  role: 'admin',
  password_confirmation: '1045717291'
)
user1 = User.create!(
  email: 'user1@venta.com',
  password: 'testme',
  role: 'admin',
  password_confirmation: 'testme'
)
user2 = User.create!(
  email: 'user2@venta.com',
  password: 'testme',
  role: 'client',
  password_confirmation: 'testme'
)
client1 = Client.create(user: user2, name: 'pablo', email: user2.email)

user3 = User.create!(
  email: 'user3@venta.com',
  password: 'testme',
  role: 'technician',
  password_confirmation: 'testme'
)
technician1 = Technician.create(user: user3, name: 'alberto', email: user3.email)

skill1 = Skill.create(name: "Metalmecanica")
skill2 = Skill.create(name: "Construccion")
skill3 = Skill.create(name: "Mecanica")
skill4 = Skill.create(name: "Electricidad")
skill5 = Skill.create(name: "Refrigeracion")
skill6 = Skill.create(name: "Carpinteria")

subskill1 = Skill.create(name: "Soldadura", parent_id: skill1.id)
subskill2 = Skill.create(name: "Tuberias sanitarias", parent_id: skill2.id)
subskill3 = Skill.create(name: "Suspension", parent_id: skill3.id)
subskill4 = Skill.create(name: "Electrico Automotriz", parent_id: skill4.id)
subskill5 = Skill.create(name: "Arires acondicionados", parent_id: skill5.id)
subskill6 = Skill.create(name: "Muebles interiores", parent_id: skill6.id)

Labour.create(skill_id: subskill1.id, title: "instalacion de reja en acero inoxidable")
Labour.create(skill_id: subskill2.id, title: "fabricacion de plantilla de 20cm en concreto")
Labour.create(skill_id: subskill3.id, title: "cambio de amortiguadores")
Labour.create(skill_id: subskill4.id, title: "cambio de bateria de 850 amp")
Labour.create(skill_id: subskill5.id, title: "Calibracion de liquido refrigerante")
Labour.create(skill_id: subskill6.id, title: "fabricacion de muebles")
