FROM rust:1.36.0

WORKDIR /app

RUN git clone https://github.com/AngelOnFira/rust-ci-tests .; \
    git checkout changes

RUN git checkout changes~3; \
    cargo build >> /log

RUN git checkout changes~2; \
    cargo build >> /log

RUN git checkout changes~1; \
    cargo build >> /log

RUN git checkout changes; \
    cargo build >> /log

RUN rm -rf target/debug/incremental

RUN git checkout changes; \
    cargo build >> /log

RUN cat /log