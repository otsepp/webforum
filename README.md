# webforum (WPO Ruby on Rails -harjoitustyö)

[Heroku](https://blueberry-surprise-52605.herokuapp.com/)

**Aiheen kuvaus**

Aiheena on webfoorumi. Webfoorumissa on käyttäjiä, eri kategorioita aiheille joihin voidaan jättää viestejä. Käyttäjä on admin, moderaattori tai tavallinen käyttäjä. Eri käyttäjätyypeillä on erilaiset oikeudet sovellukseen.

**Toiminnot (alustavat)**

*	Kirjautuminen (admin, moderator ja normaali käyttäjä)

*	Kategorian luonti/poisto/muokkaus

*	Aiheiden ja viestien luonti/poisto/muokkaus

*	Vastaaminen muiden viesteihin

* 	Eri käyttäjätyypeillä eri oikeudet eri toimintoihin

**Käyttöohje**

Admin voi luoda kategorioita.

Kuka tahansa käyttäjä voi luoda aiheita ja viestejä. 

Adminit ja kategorian moderaattorit voivat poistaa ja editoida aiheiden nimiä sekä poistaa viestejä (paitsi aiheen ensimmäistä viestiä). He ja viestin luoja voivat muokata viestien sisältöä. 

Moderaattorien oikeudet tietenkin rajoittuvat omien kategorioidensa sisälle.

Voit testata adminina tunnuksilla:

	admin

	pass

Ja Gaming-kategorian moderaattorina tunnuksilla:

	gamer_mod

	pass

**Testaus**

Kuten voi nähdä, käytännössä koko sovellus on testattu. Testaamatta on jäänyt muutama pieni asia:

*	Model-kontrollerin index-metodi (index-näkymään ei ole tehty ylimääräisiä muutoksia, joten turha testata)
*	Model-kontrollerin destroy-metodi (tällä hetkellä ei ole mahdollista poistaa käyttäjiä, mutta jätin metodin tulevaisuuden varalta)
* 	Ei näy rivikattavuudessa, mutta testaamatta jäi Subject-kontrollerin metodi, joka jakaa viestit sivuihin (olisi pitänyt!!)

![Tuntikirjanpito](/dokumentaatio/tuntikirjanpito.md)

![Kaavio](/dokumentaatio/KAAVIO.png)

[![Code Climate](https://codeclimate.com/github/otsepp/webforum.png)](https://codeclimate.com/github/otsepp/webforum)

[![Build Status](https://travis-ci.org/otsepp/webforum.png)](https://travis-ci.org/otsepp/webforum)

[![Coverage Status](https://coveralls.io/repos/github/otsepp/webforum/badge.svg?branch=master)](https://coveralls.io/github/otsepp/webforum?branch=master)

[Simplecov](https://cdn.rawgit.com/otsepp/webforum/9aa0f8fb/dokumentaatio/simplecov/index.html)
