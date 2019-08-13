# Build the Docker image:
#     docker build -t USERNAME/aws-lambda-perl
#
# Create the zip archive for AWS Lambda:
#     docker run --rm -v $PWD:/var/host USERNAME/aws-lambda-perl:latest

FROM lambci/lambda:build-python3.7

ARG PERL_VERSION="5.30.0"
ENV PERL_VERSION ${PERL_VERSION}

WORKDIR /tmp
ADD https://www.cpan.org/src/5.0/perl-${PERL_VERSION}.tar.gz .
RUN tar -xzf perl-${PERL_VERSION}.tar.gz
WORKDIR /tmp/perl-${PERL_VERSION}
RUN ./Configure -des -Dman1dir=none -Dman3dir=none -Dprefix=/opt
RUN make install
WORKDIR /opt
CMD zip -qry -9 /var/host/perl-${PERL_VERSION}-layer.zip .
