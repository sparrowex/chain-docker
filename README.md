![Sparrow Exchange](https://www.sparrowexchange.com/img/logo.png)

# nidus-docker

Docker container to set up and install [Nidus node](https://github.com/sparrowex/nidus-node).

## How

1. Build the image

    ```bash
    docker build -t nidus-node .
    ```

1. Set up

    ```bash
    mkdir ~/.nidus
    cp config.toml.default ~/.nidus/config.toml
    # edit the configuration if needed
    ```
1. Run the node, connecting to Nidus testnet by default

    ```bash
    docker run -ti --name nidus-node --rm -p 8545:8545 -p 8546:8546 -p 30303:30303 -p 30303:30303/udp -v ~/.nidus/:/root/.local/share/io.parity.ethereum/ nidus-node --base-path /root/.local/share/io.parity.ethereum/ --config /root/.local/share/io.parity.ethereum/config.toml
    ```

    Or to run as daemon:

    ```bash
    docker run -dti --restart unless-stopped --name nidus-node -p 8545:8545 -p 8546:8546 -p 30303:30303 -p 30303:30303/udp -v ~/.nidus/:/root/.local/share/io.parity.ethereum/ nidus-node --base-path /root/.local/share/io.parity.ethereum/ --config /root/.local/share/io.parity.ethereum/config.toml
    ```
