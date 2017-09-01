PROJECT_ID?=ethjar-store

all: docker
.PHONY: all

bootstrap:
	docker build -t fai_bootstrap .
.PHONY: bootstrap

docker: bootstrap
	docker run --name fai_bootstrap --privileged -ti fai_bootstrap fai-make-nfsroot -v
	docker commit -m 'chroot init' \
		fai_bootstrap eu.gcr.io/$(PROJECT_ID)/ethjar:fai
.PHONY: docker

clean:
	-docker rm -f fai_bootstrap
.PHONY: clean
