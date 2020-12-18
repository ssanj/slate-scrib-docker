# Scrib/Slate Docker

Packages the [Scrib](https://github.com/ssanj/scrib) frontend and the [Slate](https://github.com/ssanj/slate) backend creates a docker container.

## Updating to a newer version of Scrib or Slate

- Update the Scrib and Slate versions as required in `run.sh`.
- Commit the changes
- Run `run.sh`

Then execute `run.sh`

## Updating `entrypoint.sh` or the `Dockerfile`

- Update `entrypoint.sh`
- Update `Dockerfile`
- Update `publish.sh` with new image version eg. `slate:vX`
- Run `publish.sh` to build and publish new docker image version
- Update `run.sh` to use new docker image
- Commit the changes
- Run `run.sh`

## Copying across a database

- Run the application with `run.sh`
- copy your database file to the running container:

```
docker cp your_db_name.db slate-app:/app/db/scrib.db
```

_note_: a simple scrib database can be downloaded from [slate-db](https://github.com/ssanj/slate-db/releases/)


## Jumping on the running instance

```
docker exec -it slate-app /bin/bash
```