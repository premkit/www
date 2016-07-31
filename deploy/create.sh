#!/bin/bash
set -e

# Move the root directory of this repo
pushd $(cd -P -- "$(dirname -- "$0")" && pwd -P)/.. 2>&1 >/dev/null
echo `pwd`

# Get the git sha to use as a tag
rev=$(git rev-parse HEAD | cut -c1-7)
echo "Building and deploying version $rev of site"

# Build the site
echo "Building site"
docker build -t premkit-www -f ./Dockerfiles/Dockerfile.hugo .
docker run -v `pwd`/site:/src -v `pwd`/docs:/src/content -v `pwd`/hugo-config/premkit.toml:/src/config.toml -v `pwd`/output:/output -e HUGO_BASEURL=https://www.premkit.com premkit-www

# Build the static nginx container
echo "Building nginx container"
docker build -t gcr.io/replicated-static-sites/premkit-www:$rev -f ./Dockerfiles/Dockerfile .

# Push the site to docker
gcloud docker push gcr.io/replicated-static-sites/premkit-www:$rev

# Create the service
docker service create \
     --name premkit \
     --replicas 2 \
     --network ingress \
     --publish 80/tcp \
     --constraint "node.labels.publicip == ephemeral" \
     --with-registry-auth \
     gcr.io/replicated-static-sites/premkit-www:$rev

# Return to the original directory
popd 2>&1 >/dev/null
