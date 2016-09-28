NAME=tartarus
VERSION=0.9.8
VOLUMES=-v $(CURDIR)/timestamps:/var/backups/timestamps -v $(CURDIR)/conf:/var/backups/conf:ro

build:
	docker build -t ${NAME} .

shell: build
	docker run --rm -it ${NAME} bash

test: build
	docker run --rm -it ${VOLUMES} ${NAME} app:start

release:
	git commit -av -e -m "Upgrade to Tartarus ${VERSION}" && \
	git tag -f ${VERSION} && \
	git push && \
	git push --tags -f
