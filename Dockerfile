FROM rust:1.36.0

WORKDIR /app

RUN git clone https://gitlab.com/veloren/veloren.git .; \
    touch log

WORKDIR /app/server-cli

RUN for i in 10 8 6 4 2; do \
        git checkout master~$i; \
        CARGO_INCREMENTAL=1 cargo build | grep "Finished"; \
    done