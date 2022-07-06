### Instructions

#### Requirements
- docker daemnon running
- docker-compose installed

```bash
# start website
docker-compose up

# enter web server
docker-compose exec web bash

# Login as admin
# from inside the web server:
drush uli --url=http://you_local_url

# import database
# copy sql dump in mysql/backup/
# eg: mysql/backup/foo.sql.gz
docker-compose exec mysql bash
gunzip -c /backup/foo.sql.gz | mysql -u root -ptest drupal
```
