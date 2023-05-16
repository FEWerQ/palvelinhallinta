## Vagrantfile
Vagrantfilen avulla voit kopioida ympäristön mitä esimerkissä on käytetty.

## steam_latest.deb
Steam asennustiedosto mitä tarvitset asennukseen.

## installSteam.sls
Sls-tiedosto mitä ajamalla Saltissa herra-koneella voit asentaa ohjelmistot orjille.

Luo herra-koneeseen hakemistopolku /srv/salt ja tallenna steam_latest.deb sekä installSteam.sls sinne.
Aja valitsemillesi orjille komennolla:
sudo salt 'KONEEN NIMI' state.apply installSteam
