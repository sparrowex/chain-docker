FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git curl gcc libudev-dev cmake build-essential nano
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"

# Install Sparrow Chain node client
RUN git clone https://github.com/sparrowex/chain-node.git /sparrow-node

WORKDIR /sparrow-node

# UNCOMMENT the following line use develop branch
# RUN git checkout develop

RUN cargo build --release --features final
RUN ln -s /sparrow-node/target/release/parity /bin/spc-node

EXPOSE 30303 8545 8546

ENTRYPOINT ["/bin/spc-node"]
