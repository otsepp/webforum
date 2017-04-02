Category.create!([
  {name: "Gaming"},
  {name: "Cars"},
  {name: "Music"},
  {name: "Outdoors"}
])
Message.create!([
  {subject_id: 18, content: "Wat do u think\r\n\r\noiiii", user_id: 2},
  {subject_id: 18, content: "1st warning\r\n", user_id: 7},
  {subject_id: 20, content: "What is the best sports car", user_id: 2},
  {subject_id: 21, content: "DONT DO IT OR BAN", user_id: 7},
  {subject_id: 21, content: "o rly?!", user_id: 2},
  {subject_id: 38, content: "wat are the best\r\n", user_id: 7},
  {subject_id: 39, content: "no bully plz!", user_id: 7},
  {subject_id: 20, content: "i wud say that porsh 112", user_id: 2},
  {subject_id: 18, content: "lin1\r\n\r\nline2\r\n\r\nline3", user_id: 2},
  {subject_id: 21, content: "Listen to me, iPhone warriors in worldwide, poverty-stricken hermitages. Believe the picture and see the truth.\r\n2+4=6\r\n6=7\r\n7+8=ending the eternal control of hyperfucker sissy-boy prostate gods and Latino cream king slut warriors forever.\r\nLook at the numbers flying into your eyeballs and ingest them through intestines and out the sphincter of eternity into your brainwaves reverberating worldwide into four billion people, globewide, into purestrain, gold-poverty forever, culminating in the free market system = eternal peace and liberty for all souls in the sensual chokehold of Steely Dan's enormous manpussy clitoris.\r\nAll microblogged in the everwatching eyesight earzones of TV iPhone metacasts, living surrounded by the lie of cigarette cash truth youth exo-criminals written onto the parchment of our mind's soul's body's consciousness.", user_id: 2},
  {subject_id: 18, content: "THis is bullshit\r\n\r\nFuck off with this shit man it sucks", user_id: 7},
  {subject_id: 39, content: "Lmfao @ ur life", user_id: 2},
  {subject_id: 18, content: "1lineoftext", user_id: 2}
])
Subject.create!([
  {name: "Nintendo sux", category_id: 1, user_id: 7},
  {name: "sport cars", category_id: 2, user_id: 2},
  {name: "PSA: no flame wars", category_id: 1, user_id: 7},
  {name: "Nes games", category_id: 1, user_id: 7},
  {name: "PSA: no bullying", category_id: 1, user_id: 7}
])
User.create!([
  {username: "magikian", admin: false, signature: nil},
  {username: "fisherman", admin: false, signature: "I'm not a gamer because I have no life, \r\nI'm a gamer because I have many."},
  {username: "admin", admin: true, signature: "This is my signature"}
])
