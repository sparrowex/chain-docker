![Sparrow Exchange](https://www.sparrowexchange.com/img/logo.png)

# chain-docker

Sparrow Chain Docker container

## How

1. Build the image

    ```bash
    docker build -t spc-node .
    ```

1. Set up

    ```bash
    mkdir ~/.sparrow
    cp config.toml.default ~/.sparrow/config.toml
    # edit the configuration if needed

    ## If any keys to set up
    mkdir ~/.sparrow/keys
    cp key ~/.sparrow/keys/key
    cp password ~/.sparrow/password
    ```
1. Run the node, connecting to Sparrow Chain testnet by default

    ```bash
    docker run -ti -p 8545:8545 -p 8546:8546 -p 30303:30303 -p 30303:30303/udp -v ~/.sparrow/:/root/.local/share/io.parity.ethereum/ spc-node --base-path /root/.local/share/io.parity.ethereum/ --config /root/.local/share/io.parity.ethereum/config.toml
    ```
