# Komennot

## Ensimmäinen testaus

Ensimmäisenä harjoituksena lähdin tekemään yksinkertaista komentoa joka lähettää pingin Helsingin Sanomien verkkosivulle.
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

Tämän jälkeen on helppo heti testata skripti kutsumalla sitä.

> sh hs-ping.sh

