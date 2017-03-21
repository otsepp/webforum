Category.create!([
  {name: "Gaming"},
  {name: "Cars"},
  {name: "Music"}
])
Message.create!([
  {subject_id: 18, content: "Wat do u think", user_id: 2},
  {subject_id: 18, content: "1st warning\r\n", user_id: 7},
  {subject_id: 20, content: "What is the best sports car", user_id: 2},
  {subject_id: 21, content: "DONT DO IT OR BAN", user_id: 7},
  {subject_id: 21, content: "o rly?!", user_id: 2},
  {subject_id: 38, content: "wat are the best\r\n", user_id: 7}
])
Subject.create!([
  {name: "Nintendo sux", category_id: 1, user_id: 7},
  {name: "sport cars", category_id: 2, user_id: 2},
  {name: "PSA: no flame wars", category_id: 1, user_id: 7},
  {name: "Nes games", category_id: 1, user_id: 7}
])
User.create!([
  {username: "magikian", admin: false},
  {username: "fisherman", admin: false},
  {username: "admin", admin: true}
])
