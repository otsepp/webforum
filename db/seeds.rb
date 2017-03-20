Category.create!([
  {name: "Gaming"},
  {name: "Cars"},
  {name: "Music"}
])
Message.create!([
  {subject_id: 1, content: "How do I into PC gaming??", user_id: 1},
  {subject_id: 1, content: "purchase an alienware", user_id: 2}
])
Subject.create!([
  {name: "PC gaming", category_id: 1, user_id: 1}
])
User.create!([
  {username: "magikian", admin: false},
  {username: "fisherman", admin: false},
  {username: "admin", admin: true}
])
