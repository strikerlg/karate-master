## BUILDING
##   (from project root directory)
##   $ docker build -t python-for-strikerlg-karate-master .
##
## RUNNING
##   $ docker run python-for-strikerlg-karate-master

FROM gcr.io/stacksmith-images/debian-buildpack:wheezy-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="7v306w0" \
    STACKSMITH_STACK_NAME="Python for strikerlg/karate-master" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install python-3.5.2-1 --checksum 6347e5d0c2e318d9bf25a927dc6762bd8a6e490bfab06179179545fa9d3e0d3c

ENV PATH=/opt/bitnami/python/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Django template
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
