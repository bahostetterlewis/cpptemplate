FROM project_name/build:latest

MAINTAINER Company, Group, Person

WORKDIR /
COPY requirements.sh .
RUN ./requirements.sh

WORKDIR /build
CMD cmake -GNinja -DTESTS=ON ../project && cmake --build . && ctest