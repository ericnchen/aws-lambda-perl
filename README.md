# aws-lambda-perl

Dockerfile to build an image with Perl 5 installed to `/opt` and a default command to create a zip archive.

The current version is: `5.30.0`

## Usage

Build the Docker image:

    make build

Create the zip archive for AWS Lambda:

    make package

Clean up any and all files generated:

    make clean

### Options

The following environment variables are used:

- `IMAGE_TAG` sets the Docker image tag (default: `latest`)
- `IMAGE_TAG_USERNAME` sets the username portion of the Docker image name (default: `$USER`)
