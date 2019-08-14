# Build Layer
FROM lambci/lambda:build
ADD perl-*.tar.gz /tmp/
RUN cd /tmp/perl-* && ./Configure -des -Dman1dir=none -Dman3dir=none -Dprefix=/opt
RUN cd /tmp/perl-* && make
RUN cd /tmp/perl-* && make install

# Deployment Layer (w/ Node for Serverless)
FROM lambci/lambda:build-nodejs10.x
COPY --from=0 /opt/ /opt/