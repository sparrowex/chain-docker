FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git curl gcc libudev-dev cmake build-essential nano
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# RUN /bin/bash -c "source $HOME/.cargo/env"
ENV PATH="/root/.cargo/bin:$PATH"

# Install SPC client
RUN git clone https://github.com/sparrowex/chain-node.git /spc-parity

WORKDIR /spc-parity
# RUN git checkout sparrow
RUN cargo build --release --features final
RUN ln -s /spc-parity/target/release/parity /bin/spc-node

EXPOSE 30303 8545 8546

ENTRYPOINT ["/bin/spc-node"]
