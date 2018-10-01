![Sparrow Exchange](https://www.sparrowexchange.com/img/logo.png)

# chain-docker

Sparrow Chain Docker container

## How

1. Copy the config file and update settings (if any)

    ```bash
    cp config.toml.default config.toml
    ```

1. Build the image

    ```bash
    docker build -t spc-node .
    ```

1. Run the node, connecting to Sparrow Chain testnet by default

    ```bash
    docker run spc-node
    ```
