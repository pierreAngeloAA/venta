user1 = User.create!(
  email: 'user1@venta.com',
  password: 'testme',
  role: 'admin',
  password_confirmation: 'testme'
)

skill1 = Skill.create(name: "Metalmecanica")
skill2 = Skill.create(name: "Construccion")
skill3 = Skill.create(name: "Mecanica")
skill4 = Skill.create(name: "Electricidad")
skill5 = Skill.create(name: "Informatica")
skill6 = Skill.create(name: "Carpinteria")

Labour.create(skill_id: skill1.id, title: "soldadura")
Labour.create(skill_id: skill2.id, title: "levante de muro")
Labour.create(skill_id: skill3.id, title: "suspension")
Labour.create(skill_id: skill4.id, title: "instalaciones electricas")
Labour.create(skill_id: skill5.id, title: "instalaciones de sofware")
Labour.create(skill_id: skill6.id, title: "fabricacion de muebles")
