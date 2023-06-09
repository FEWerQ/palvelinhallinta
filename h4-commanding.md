# Komennot

Käytän luennolla otettuja muistiinpanoja apuna.

## Skriptin luominen

Ensimmäisenä harjoituksena lähdin tekemään yksinkertaista skriptiä joka lähettää pingin Helsingin Sanomien verkkosivulle.
Tätä varten loin herra-koneelle kansion "commands-practice" johon laitan kaikki tulevat skriptit, ja loin sinne skriptin nimeltä hs-ping.sh.

> mkdir commands-practice
> 
> touch hs-ping.sh

Muokkasin skriptin sisälle käskyn joka ilmoittaa terminaalissa mitä se tekee ja antaa ping-komennon www.hs.fi.

> micro hs-ping.sh
> 
> > #!/usr/bin/bash
> >
> > echo 'Pinging www.hs.fi...'
> >
> > ping -c 3 www.hs.fi

### Testi

Tämän jälkeen on helppo heti testata skripti kutsumalla sitä.

> sh hs-ping.sh
![pingtest1](screenshots/h4-pingtest1.png)
### Oikeudet ja siirto käyttäjille

Annetaan oikeudet suorittaa skripti kaikille. Komennossa ugo tarkoittaa U = tiedoston omistaja, eli user, G = ryhmään kuuluvat, eli group, O = muut, eli other. X = suoritusoikeus eli execute.

> chmod ugo+x hs-ping.sh

Tiedosto on nyt valmis ja sen voi kopioida käyttäjille. Polku "/usr/local/bin" on tarkoitettu ohjelmille mitä normaali käyttäjä voi ajaa. Siellä ne ovat suojassa esimerkiksi muutoksilta järjestelmäpäivityksien aikana.

> sudo cp hs-ping.sh /usr/local/bin
> cd /usr/local/bin
> ls -l
![execution priviledges](screenshots/h4-xrights.png)
Voidaan todeta että suoritusoikeudet ovat varmasti säilyneet ja ollaan kopioitu haluttu asia.

Jälleen on hyvä aika testata että kaikki toimii:

> hs-ping.sh
![pingtest2](screenshots/h4-pingtest2.png)
## hello.py - Python skripti

Python on minulle uusi juttu, joten teen vanhasta tutun fizz buzz harjoituksen. Tarkistaen vain W3Schoolsista tarvittaessa kirjoitusmuodon.

Toistoa aiemmasta; luodaan tiedosto python skriptille, annetaan siihen ajo-oikeudet kaikille, siirretään se kaikkien käyttäjien käytettäväksi.

> touch helloworld.py
> 
> micro helloworld.py
> > #!/usr/bin/python
> > 
> > print("Hello world, here's fuzzvyzz to 30.")
> > 
> > for i in range(1,31):
> > 
> > output = ""
> > 
> > if i % 3 == 0:
> > 
> >   output += "Fizz"
> >   
> > if i % 5 == 0:
> > 
> >   output += "Buzz"
> >   
> > if output == "":
> > 
> >    output = i
> >     
> > print(output)
> chmod ugo+x helloworld.py
> sudo cp helloworld.py /usr/local/bin
![python code](screenshots/h4-python_code.png)
Kun olin siirtänyt helloworld.py /usr/local/bin, tajusin ettei skripti enää toiminut. Ilmeisesti se ei osannut enää hakea mitä vain pythonia, vaan sille piti määrätä tietty versio. Tässä tapauksessa python3.

> #!/usr/bin/python
> 
> #!/usr/bin/python3

Pieni muutos.

## Jako orjille

Kopioin helloworld.py saltin omaan alakansioon mihin skriptit voi keskittää helpompaa käyttöä varten. Näin ne on myös tallennettu paikkaan joka ei niin herkästi muutu.

> sudo cp helloworld.py /srv/salt/skripti

Muokataan init.sls tiedosto jolla orjille asennettavat asiat määritellään.

> micro init.sls
> > /usr/local/bin/helloworld.py:
> > 
> >   file.managed:
> >   
> >     - mode: '0755'
> >     
> >     - source: salt://skripti/helloworld.py

Lähetetään orjakoneille uudet tilat joita ylläpitää:

> sudo salt '*' state.apply skripti

## Testaus orjilla

Kirjauduin sisään t001 koneelle ja ajoin heti skriptin komennolla helloworld.py.
> helloworld.py

Oli helppo todeta että skriptien asennus onnistui.
![python script running on slave t001](screenshots/h4-python_run_slave.png)
## Ohjelman asennus herralle

Seuraavaksi pyrin asentamaan tekstinkäsittelyohjelma Micron orjakoneille automaagisesti. Tämä käytiin luennolla läpi.

Ensimmäinen askel on ladata micro.
> wget https://github.com/zyedidia/micro/releases/download/v2.0.11/micro-2.0.11-linux64-static.tar.gz
Tällä haetaan githubista haluttu versio, tämä valitaan oman käyttöjärjestelmän ja laitteiston mukaan.

Tiedosto täytyy purkaa, sillä se on tiivistetty (gz tiedosto).
> tar -xf micro-2.0.11-linux64-static.tar.gz

Kopioin micro-tiedoston syntyneestä kansiosta ohjelmille luotuun jakelukansioon saltin alla sekä polkuun /usr/local/bin.
> sudo cp ~/micro-2.1.11/micro .

## Asennus orjille

Loin ensimmäisenä oman kansion nimeltä "default-softwares" polkuun /srv/salt "skripti" kansion rinnalle.
Kansion sisälle init.sls tiedosto, ja tiedostoon seuraava:


> > /usr/local/bin/micro:
> > 
> >   file.managed:
> >   
> >     - mode: '0755'
> >     
> >     - source: "salt://default-softwares/micro"

Jonka jälkeen ajoin sen kaikille orjille:

> sudo salt '*' state.apply default-softwares
![micro automagic](screenshots/h4-micro_installed.png)
Siirryin orjakoneelle t001 ja ajoin komennon "micro".
Micro käynnistyi onnistuneesti.
