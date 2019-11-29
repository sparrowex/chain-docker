docker build -t nidus-node .
mkdir ~/.nidus
cp config.toml.default ~/.nidus/config.toml
docker run -dti --restart always --name nidus-node -p 8545:8545 -p 8546:8546 -p 30303:30303 -p 30303:30303/udp -v ~/.nidus/:/root/.local/share/io.parity.ethereum/ nidus-node --base-path /root/.local/share/io.parity.ethereum/ --config /root/.local/share/io.parity.ethereum/config.toml
