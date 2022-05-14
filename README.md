# iZadanky frontend app

## Requirements

You need `docker` and `docker-compose` to run the app.

## Installation and configuration - backend

### Pull latest docker images

```shell
docker-compose pull
```

### Add iPharm environment variable files

The app depends on the [iPharm app](https://github.com/conceptica-cz/ipharm-be).

Create a environment variable files for iPharm app:

- `./.envs/.development/.ipharm_app`

```shell
SECRET_KEY=...
DEBUG=True
ALLOWED_HOSTS=*,ipharm_app
CORS_ALLOW_ALL_ORIGINS=True
ENVIRONMENT=local
LOG_LEVEL=DEBUG
```

- `./.envs/.development/.ipharm_postgres`

```shell
POSTGRES_HOST=ipharm-postgres
POSTGRES_PORT=5432
POSTGRES_DB=ipharm
POSTGRES_USER=ipharm
POSTGRES_PASSWORD=ipharm
```

- `./.envs/.development/.ipharm_redis`

```shell
REDIS_HOST=ipharm-redis
REDIS_PORT=6379
```

See the [iPharm app](https://github.com/conceptica-cz/ipharm-be) for more information about variables.

### Run iPharm app

```
$ docker-compose up -d ipharm-app
```

### Create iPharm superuser

```
$ docker-compose exec ipharm-app python manage.py createsuperuser
```

Now you can login to the iPharm app's admin on localhost:8001/admin/

### Populate iPharm database with fake data

```
$ docker-compose exec ipharm-app python manage.py populate
```

### Add `izadanky` user and token to iPharm

To use [iPharm](https://github.com/conceptica-cz/ipharm-be) API you have to get a token.

Add `ipharm` (you can choose any name) user to
iPharm:  [create user](http://localhost:8001/admin/users/user/add/).

Create token for the added user:  [create token](http://localhost:8001/admin/authtoken/tokenproxy/add/).

You have to add the token to the `.envs/.development/.izadanky_app` file (`IPHARM_TOKEN` variable).

### Add environment variable files

Create a environment variable files for iZadanky app:

- `./.envs/.development/.izadanky_app`

```shell
SECRET_KEY=...
DEBUG=True
ALLOWED_HOSTS=*,izadanky_app
CORS_ALLOW_ALL_ORIGINS=True
IPHARM_TOKEN=...
ENVIRONMENT=local
LOG_LEVEL=DEBUG
```

- `./.envs/.development/.izadanky_postgres`

```shell
POSTGRES_HOST=izadanky-postgres
POSTGRES_PORT=5432
POSTGRES_DB=izadanky
POSTGRES_USER=izadanky
POSTGRES_PASSWORD=izadanky
```

- `./.envs/.development/.izadanky_redis`

```shell
REDIS_HOST=izadanky-redis
REDIS_PORT=6379
```

### Run the app

```
$ docker-compose up -d
```

### Create superuser

```
$ docker-compose exec izadanky-app python manage.py createsuperuser
```

Now you can login to the app's admin on localhost:8000/admin/

### Populate database with fake data

```
$ docker-compose exec izadanky-app python manage.py populate
```

## REST API

OpenAPI UI: `/api/v1/schema/`

Swagger scheme: `/api/v1/schema/swagger-ui/`
