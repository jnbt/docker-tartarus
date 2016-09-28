# Tartarus on debian:jessie

[![docker hub](https://img.shields.io/badge/docker-image-blue.svg?style=flat)](https://registry.hub.docker.com/u/jnbt/tartarus/)
[![](https://images.microbadger.com/badges/version/jnbt/tartarus.svg)](https://registry.hub.docker.com/u/jnbt/tartarus/)
[![microbadger](https://images.microbadger.com/badges/image/jnbt/tartarus.svg)](https://microbadger.com/images/jnbt/tartarus)

## Usage

### Simple usage

Any content mounted to `/var/backups/in` will be included into the backup:

    docker run --rm -i \
      -v path/to/backup:/var/backups/in:ro \
      -v target:/var/backups/out \
      jnbt/tartarus

### Incremental backups

You can perform incremental backups using `app:start -i` but you should mount
a persistend volume to `/var/backups/timestamps` otherwise Tartarus cannot
determine the updated files:

	docker run --rm -i \
	  -v path/to/backup:/var/backups/in:ro \
	  -v target:/var/backups/out \
	  -v timestamps:/var/backups/timestamps \
	  jnbt/tartarus \
	  app:start -i

### Advanced usage

You can use the [full power of Tartarus](http://wertarbyte.de/tartarus/doc/tartarus.txt) by providing
an own set of backup configurations. The container will automatically run any `*.conf`-configuration
provided at `/var/backups/conf`:

    docker run --rm -i \
      -v conf:/var/backups/conf:ro \
      -v path/to/backup:/var/backups/in:ro \
      -v timestamps:/var/backups/timestamps \
      ...
      jnbt/tartarus

### Encryption

Tartarus is assuming the encription passphrase in a file. You may either mount
the passphrase-file into the container or provide a `ENCRYPT_PASSPHRASE`
environment variable which will be stored at `/var/backups/passphrase`.

## Software

* [debian:jessie](https://hub.docker.com/_/debian)
* [Tartarus 0.9.8](https://github.com/wertarbyte/tartarus)

## Release

* `Makefile`: Bump `VERSION`
* `Dockerfile`: Bump `TARTARUS_VERSION` and `RELEASE_DATE`
* `README.md`: Bump versions in `Software` section
* Run `make release`
