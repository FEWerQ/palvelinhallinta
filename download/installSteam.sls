#/srv/salt/installSteam.sls

installGdebi:
  pkg.installed:
    - names:
      - gdebi
      - micro

/srv/salt/steam_latest.deb:
  file.managed:
    - source: salt://steam_latest.deb
    - mode: '0644'
    - makedirs: True

installSteam:
  cmd.run:
    - name: gdebi --non-interactive /srv/salt/steam_latest.deb
    - refresh: True
    - allow_updates: True
    - require:
      - pkg: installGdebi

updateSystem:
  pkg.uptodate:
    - refresh: True
    - require:
      - cmd: installSteam
