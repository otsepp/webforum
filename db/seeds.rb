c1 = Category.create name: "Gaming"

u1 = User.create username: "admin", admin: true, signature: "Respect my authority", password: "pass", password_confirmation: "pass"
u2 = User.create username: "gamer_mod", signature: "World Peace", moderator_category_id: c1.id, password: "pass", password_confirmation: "pass"
u3 = User.create username: "Yak", password: "pass1", password_confirmation: "pass1"
u4 = User.create username: "Gam3r", password: "pass2", password_confirmation: "pass2"
u5 = User.create username: "Mimic", password: "pass3", password_confirmation: "pass3"
u6 = User.create username: "demonik", signature: "wat r u looking at", password: "pass4", password_confirmation: "pass4"
u7 = User.create username: "Knob", password: "pass5", password_confirmation: "pass5"
u8 = User.create username: "solider1337", password: "pass6", password_confirmation: "pass6"
u9 = User.create username: "cello", signature: "challenge me online", password: "pass7", password_confirmation: "pass7"
u10 = User.create username: "price_isnt_right", password: "pass8", password_confirmation: "pass8"

subj = Subject.create name: "Name some useless weapons in NES games", user_id: u2.id, category_id: c1.id
c1.subjects.
c1.subject << subj

msg1 = Message.create content: "There are many great and memorable weapons in NES games. A few notable ones would be the Spread Gun from Contra/Super C, Metal Blade from Mega Man 2, Kiai (scrolls) from TMNT 1, Jump & Slash from Ninja Gaiden 1, so on and so forth...
Most weapons acquired in NES games serve at least some purpose in helping you succeed. But there are ones that don't. Here are a few off the top of my head that are (in my opinion) useless:
Thorn Whip [Castlevania II] - The first available whip upgrade in the game, it really isn't worth spending the hearts to get it. I feel that you're better off saving your hearts and sticking with the starting leather whip until you get the chain whip.
Diamond [also CV II] - Weapon really has no use. I usually grab it just to feel like I 100% beat the game, but I never use it. Plus, you have to go out of the way to get it (and deal with those vertically moving stone platforms).
Machine Gun [Bionic Commando] - The last gun you acquire in the game. By the time you obtain it there are only 3 levels left to beat, and the Rocket Launder is optimum for all 3.
Fire [The Krion Conquest] - It drains your health bar to use, and doesn't really help you in any part of the game. I never use it.
Rocket Launcher [G.I. Joe: The Atlantis Factor] - Another weapon you obtain late in the game. There isn't much time to level it up, it uses a lot of ammo, and the Laser Rifle is much more potent against the bosses.
What are some weapons that you find to be useless? Let's hear em!", subject_id: subj.id, user_id: u2.id

msg2 = Message.create content: "the cane in Dr. Jeykll Mr. Hyde", subject_id: subj.id, user_id: u3.id

msg3 = Message.create content: "The Guardian Legend: everything except for the vertical and horizontal light sabers, dual laser, and the enemy eraser.
Ghosts 'n Goblins: Torches. Weapon upgrades shouldn't make the game harder. Axes aren't much better. In fact, every non-sword weapon sucks. Crosses are okay.
Mega Man 2: Leaf shield.", subject_id: subj.id, user_id: u4.id

msg4 = Message.create content: "The upgraded gun in Festers Quest spread your bullets.
The problem is that walls stops your bullets, and many times you are walking in narrow corridors that only allows your Level 1 bullets to move forward, which kinda makes your upgraded gun useless.
Luckily they fixed this in the PAL version.", subject_id: subj.id, user_id: u5.id

msg5 = Message.create content: "The torch in Ghosts & Goblins is pretty terrible", subject_id: subj.id, user_id: u6.id

msg6 = Message.create content: "Those stupid donut rings as a weapon in Stinger - short range, low damage.
The flamethrower in Contra is mostly useless - somewhat helpful in the 3D stages but otherwise it's weak.
Top Man's Top Spin attack in MegaMan 3 usually hurts you twice as much as it hurts the enemy.
Nearly all melee weapons in Ultima: Exodus, even the mystic sword, which is supposedly the most powerful weapon in the game.
The legend sword in Magic of Scheherazade isn't useless per se, but by the time you get it you need to be a different class to finish the game and you won't be able to use it for anything practical.", subject_id: subj.id, user_id: u7.id

msg7 = Message.create content: "Topspin is also one of the funniest weapons in the megaman series..it leaves me thinking why they left it in there
like it has no reach and the enemies hurt you when you get near and if the spin is not powerful enough to kill them you are guaranteed to get hurt...so not worth it
..but all megaman is doing is spinning...not even that stylistically..there are some extra animations but it essentially looks like pushing left and right really fast...and people claim MM3 is on par with MM2 HAH...
it actually is useful against some of the bosses BTW, but that is only because they will take more damage than you will", subject_id: subj.id, user_id: u8.id

msg8 = Message.create content: "If I remember correctly, the top spin kills one of the Wily forms with one hit...but I haven't played three in a while, so I might be misremembering.", quote_id: msg7.id, subject_id: subj.id, user_id: u6.id

msg9 = Message.create content: " You are correct. Top Spin is the weakness to the second part of the final Wily battle. IIRC it is one hit.",
quote_id: msg8.id, subject_id: subj.id, user_id: u2.id

msg10 = Message.create content: "If an enemy is weak to Top Spin, it dies in one hit and you don't take any damage at all. About half the enemies in MM3 are weak to it, including a few notables like the monkeys at Hard Man's stage, top belly guys at Top Man's stage and the junk robots in Wily 4. But of course there are usually better alternatives than TO.
Top Spin is also the main weakness of 5 bosses, including 3 in the Wily fortress. No other weapon has as many weak bosses to it in MM3. It's a pretty good weapon IMO. Spark Shock, Skull Barrier and Power Stone are way worse.", subject_id: subj.id, user_id: u9.id

msg11 = Message.create content: "Many games have at least one useless weapon. If I think about it more, I'll likely come up with some later (like maybe in Metal Gear, Snake's Revenge), but offhand:
- Zelda 1- Magic Book. It's counterproductive. The flame can harm you and it slows down the Wand's firing speed.
- Zelda II- For as late as it comes, Spell feels like it has little use. Fairy filled its place (escaping from dangerous enemies) until then.
- Castlevania II- Diamonds yeah, Thorn Whip too.
- Kid Icarus- The Map, Pencil, Torch. Takes so many items to make a map and the level of detail is nothing. Drawing a paper map in person serves the purpose. The Flaming Arrow, for the effort to get it doesn't deliver a reliable extra hit. There's no reason to get it before the Protective Crystal or Sacred Bow. ", 
subject_id: subj.id, user_id: u10.id

msg12 = Message.create content: "Final Fantasy weapons I never use: They're not exactly useless but other weapons are better.
-Wooden Staff
-Hand Axe
-Scimitar
-Iron Nunchucks
-Iron Staff
-Long Sword
-Great Axe
-Silver Axe
-Giant Sword
-Were Sword
-Power Staff
-Vorpal
Final Fantasy magic
Completely useless:
-LOCK
-TMPR
-LOK2
-SABR
-XFER
Not that useful or reliable:
-AMUT
-FEAR
-SLP2
-SOFT (Due to it's price. Soft potions are way cheaper)
-RUB
-BLND", subject_id: subj.id, user_id: u1.id
