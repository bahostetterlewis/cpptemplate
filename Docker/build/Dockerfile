FROM alpine:3.5

MAINTAINER Company, Group, Person

COPY requirements.sh .
RUN ./requirements.sh

RUN mkdir /project
RUN mkdir /build
RUN mkdir /build_output
WORKDIR /build
CMD cmake -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DTESTS=OFF ../project && cmake --build . --target executable_name && cp src/executable_name /build_output