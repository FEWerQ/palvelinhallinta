# Komennot

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

## Testi

Tämän jälkeen on helppo heti testata skripti kutsumalla sitä.

> sh hs-ping.sh

## Oikeudet ja siirto käyttäjille

Annetaan oikeudet suorittaa skripti kaikille. Komennossa ugo tarkoittaa U = tiedoston omistaja, eli user, G = ryhmään kuuluvat, eli group, O = muut, eli other. X = suoritusoikeus eli execute.

> chmod ugo+x hs-ping.sh


