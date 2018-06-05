# Docker 'scp only' test
Proof of concept for a docker container running a SFTP only SSH server.

**Note:** This is just a proof of concept that should be no means run in production!!!

## Build and run: Docker compose
**Build**

    docker-compose build

**Run**

    docker-compose up


## Build and Run: Docker
**Build**

    docker build --tag sftp-only-test .

**Run**

    docker run --rm -ti -p 5000:22 --name sftp-only-test -v $(pwd)/cert:/cert -v $(pwd)/data:/data sfpt-only-test


## Test the result
You can sftp into the container via:

    sftp -oPort=5000 anonymous@localhost
