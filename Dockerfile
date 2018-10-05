FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git curl gcc libudev-dev cmake build-essential nano
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"

# Install Nidus node client
RUN git clone https://github.com/sparrowex/nidus-node.git /nidus-node

WORKDIR /nidus-node

# UNCOMMENT the following line use develop branch
# RUN git checkout develop

RUN cargo build --release --features final
RUN ln -s /nidus-node/target/release/parity /bin/nidus-node

EXPOSE 30303 8545 8546

ENTRYPOINT ["/bin/nidus-node"]
