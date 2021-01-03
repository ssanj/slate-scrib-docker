# Scrib/Slate Docker

Packages the [Scrib](https://github.com/ssanj/scrib) frontend and the [Slate](https://github.com/ssanj/slate) backend creates a Docker container.

## Updating to a newer version of Scrib or Slate

- Update `publish.sh` with the latest versions of `SLATE_VERSION` and
`SCRIB_VERSION`. Also bump `BUILD_VERSION`
- This will build and publish an image of the form: `${BUILD_VERSION}-SL_${SLATE_VERSION}-SC_${SCRIB_VERSION}`
- Update `run.sh` with the new image version and SLATE_API_KEY (if changed)
- Update `docker-compose` with the new image version and SLATE_API_KEY (if changed)

## Database

There's a simple version of the slate database at `./volumes/slate-app/db/`. This can be downloaded from [slate-db](https://github.com/ssanj/slate-db/releases/). When releasing to Prod ensure to use an the current version of the database

## Docker-compose

_Ensure to use your required `SLATE_API_KEY` environment variable in `docker-compose.yml` when running._

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

To run via Docker use:

```
./run.sh
```

and stop with:

```
docker stop slate-app
```


## Jumping on the running instance

```
docker exec -it slate-app /bin/bash
```