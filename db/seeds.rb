c1 = Category.create name: "Gaming"

User.create username: "admin", admin: true, signature: "Respect my authority", password: "pass", password_confirmation: "pass"
User.create username: "gamer_mod", signature: "World Peace", moderator_category_id: c1.id, password: "pass", password_confirmation: "pass"
