.PHONY: all

all: clean build binary

DOCKER_IMAGE_PREFIX=hephaex/fasttext
DOCKER_BUILD_CMD=docker build

clean:
	rm -rf ./data/.
	rm -rf ./result/.

build:
	$(DOCKER_BUILD_CMD) -t $(DOCKER_IMAGE_PREFIX):devel -f Dockerfile .
	$(DOCKER_BUILD_CMD) -t $(DOCKER_IMAGE_PREFIX):latest -f Dockerfile .

binary: build
	docker run --rm $(DOCKER_IMAGE_PREFIX):devel cat ./fasttext > fasttext.bin
	chmod +x fasttext.bin
	$(DOCKER_BUILD_CMD) -t $(DOCKER_IMAGE_PREFIX):binary -f Dockerfile.binary .
	rm fasttext.bin

# -----
# Other make options below
# -----

test:
	docker run --rm -it $(DOCKER_IMAGE_PREFIX):devel ./example.sh

run:
	docker run --rm -it $(DOCKER_IMAGE_PREFIX):devel /bin/bash

example:
	mkdir -p /tmp/data && mkdir -p /tmp/result
        docker run --rm -it -v /tmp/data:/data -v /tmp/result:/result hephaex/fasttext example.sh 

publish:
	docker push $(DOCKER_IMAGE_PREFIX):devel
	docker push $(DOCKER_IMAGE_PREFIX):latest
	docker push $(DOCKER_IMAGE_PREFIX):binary
