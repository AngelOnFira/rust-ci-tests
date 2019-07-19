FROM rust:1.36.0

WORKDIR /app

RUN git clone https://github.com/AngelOnFira/rust-ci-tests .; \
    git checkout changes; \
    touch log

RUN git checkout changes~3; \
    bash -c cargo run &>> log

RUN git checkout changes~2; \
    bash -c cargo run &>> log

RUN git checkout changes~1; \
    bash -c cargo run &>> log

RUN git checkout changes; \
    bash -c cargo run &>> log

RUN rm -rf target/debug/incremental

RUN git checkout changes; \
    bash -c cargo run &>> log

RUN cat log