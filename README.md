# Deploy

```
$ cp .env.example .env
$ docker-compose up -d
$ docker-compose run --rm web /bin/bash
$ rails db:create && rails db:schema:load && rails db:seed:single[fakees]
$ exit
```
# Документация

[Схема REST](http://docs.junkyardcatapodxyz.apiary.io)
