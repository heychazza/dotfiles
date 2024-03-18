orb start

docker run \
    -d --name singlestoredb-dev \
    -e SINGLESTORE_LICENSE=$(op read "op://Personal/SingleStore License Key/credential") \
    -e ROOT_PASSWORD="password" \
    --platform linux/amd64 \
    -p 13306:3306 -p 18080:8080 -p 19000:9000 \
    ghcr.io/singlestore-labs/singlestoredb-dev:latest