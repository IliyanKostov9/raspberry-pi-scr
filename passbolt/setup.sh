# docker compose -f docker-compose-ce.yaml up -d

sudo docker compose -f docker-compose-ce.yaml \
  exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
  passbolt register_user \
  -u iliyan.kostov@email.ikostov.org \ 
  -f Iliyan \ 
  -l Kostov \
  -r admin" -s /bin/sh www-data
