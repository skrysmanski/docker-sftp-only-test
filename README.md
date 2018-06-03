# Docker 'scp only' test
Proof of concept for a docker container running a SFTP only SSH server.

**Note:** This is just a proof of concept that should be no means run in production!!!


## Build

    docker build --tag sftp-only-test .

## Run

    docker run --rm -ti -p 5000:22 --name sftp-only-test -v $(pwd)/data:/app sfpt-only-test
