# Scrib/Slate Docker

Packages the [Scrib](https://github.com/ssanj/scrib) frontend and the [Slate](https://github.com/ssanj/slate) backend creates a Docker container.

## Updating to a newer version of Scrib or Slate

- Update `publish.sh` with the latest versions of:
  - `SLATE_VERSION`
  - `SCRIB_VERSION`
  - `BUILD_VERSION` (Bump)
- Run `publish.sh`
- This will build and publish an image of the form: `${BUILD_VERSION}-SL_${SLATE_VERSION}-SC_${SCRIB_VERSION}`
- Update `.env` with the full image repository/image url. Both `run.sh` and `docker-compose.yml` will source image to run from `.env`
- Update `run.sh` with the new image version and SLATE_API_KEY (if changed)
- Update `docker-compose` with the new image version and SLATE_API_KEY (if changed)

## Database

There's a simple version of the slate database at `./volumes/slate-app/db/`. This can be downloaded from [slate-db](https://github.com/ssanj/slate-db/releases/). When releasing to Prod ensure to use an the current version of the database

```
curl -L https://github.com/ssanj/slate-db/releases/download/${DB_VERSION}/slate-${DB_VERSION}.db --output /volumes/slate-app/db/scrib.db
```

This database volume will be mounted when running `run.sh`

## Docker-compose

_Ensure to use your required `SLATE_API_KEY` environment variable in `docker-compose.yml` when running._

Docker-compose is used to start app locally and it runs on port 5000.

To run with Docker Compose, use:

```
docker-compose up
```

and stop with:

```
docker-compose down
```

## Docker

_Ensure to use your required `SLATE_API_KEY` environment variable when running through `run.sh`._

`run.sh` is used to run this application locally and as such it starts the app on port 5000.

To run via Docker use:

```
./run.sh
```

To stop the app:

```
docker stop slate-app
```


## Jumping on the running instance

```
docker exec -it slate-app /bin/bash
```

## Updating Image and Restarting the System

```
docker-compose pull
docker-compose down
docker-compose up -d --remove-orphans
docker image prune
```

## Production Deploy

See: blog-docker-containers
