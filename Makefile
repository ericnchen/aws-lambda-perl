# Build the Docker image:
#     make build
#
# Create the zip archive for AWS Lambda:
#     make package

IMAGE_TAG ?= latest
IMAGE_TAG_USERNAME ?= $(shell whoami)

default: help
help:
	@echo "Usage: make [options] target"
	@echo ""
	@echo "Targets:"
	@echo "    build      build the aws-lamba-perl container"
	@echo "    package    package the layer as a zip archive"
	@echo "    clean      remove any files that were created"

build:
	docker build --force-rm -t ${IMAGE_TAG_USERNAME}/aws-lambda-perl:${IMAGE_TAG} .

package:
	docker run --rm -v ${PWD}:/var/host ${IMAGE_TAG_USERNAME}/aws-lambda-perl:${IMAGE_TAG}

clean:
	rm -f perl-*-layer.zip

