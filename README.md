# aws-lambda-perl

Provides a Docker image with a base Perl 5 runtime installed to `/opt` for use with AWS Lambda.

**Notes**

- The resulting Docker image is based on `lambci/lambda:build-nodejs10.x`.
- This is a minimal installation with `man` pages removed and with only the default set of modules.

**Tags**

- `latest`, `5.30.0`

## Usage

To create a zip archive with a pre-built (e.g., `latest`) image hosted on Docker Hub:

    docker run --rm -v ${PWD}:/var/host ericnchen/aws-lambda-perl:latest bash -c "cd /opt; zip -qry -9 /var/host/perl-layer.zip ."

There should now be a zip archive called `perl-layer.zip` which can be uploaded to AWS Lambda.

## Build

Clone the repository from Github:

    git clone https://github.com/ericnchen/aws-lambda-perl.git

Download the source code for Perl 5 and put it into the same directory.
This can be done manually or with `curl`:

    curl -LO https://www.cpan.org/src/5.0/perl-5.30.0.tar.gz

Build the Docker image:

    docker build -t aws-lambda-perl:latest .

There should now be a Docker image called `aws-lambda-perl:latest` with Perl 5 installed to `/opt`.
This can then be packaged up for AWS Lambda:

    docker run --rm -v ${PWD}:/var/host aws-lambda-perl:latest bash -c "cd /opt; zip -qry -9 /var/host/perl-layer.zip ."

There should now be a zip archive called `perl-layer.zip` which can be uploaded to AWS Lambda.
