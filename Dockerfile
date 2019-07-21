FROM rust:1.36.0

WORKDIR /app

RUN git clone https://github.com/AngelOnFira/rust-ci-tests .; \
    git checkout changes; \
    touch log

RUN git checkout changes~3; \
    cargo run

RUN git checkout changes~2; \
    cargo run

RUN git checkout changes~1; \
    cargo run

RUN git checkout changes; \
    cargo run

RUN rm -rf target/debug/incremental

RUN git checkout changes; \
    cargo run

RUN cat log