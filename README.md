# Hosting [Mastodon](https://github.com/tootsuite/mastodon) on latest Oracle Cloud free powerful ARM instance

Currently this repo is updated to use Mastodon `v3.4.1` and corresponding Elasticsearch `v7.10.1`

## Create instance

1. Go to page [https://cloud.oracle.com/compute/instances/create](https://cloud.oracle.com/compute/instances/create)
2. Fill in instance name, such as `mastodon`
3. Edit `Image and shape`, make sure to choose `VM.Standard.A1.Flex` with the CPU cores and memory size you need, max 4 cores and 24G memory
4. Edit `Image and shape`, make sure to choose the right image, support both `Oracle Linux` as well as `Ubuntu` none minimal version. In this guide, assumption `Ubuntu` is used
5. Double check step 3 and 4, as sometimes updating one of them will automatically change another's settings, making sure you have chosen the right image and shape
6. (Optional) Tick `Specify a custom boot volume size`, and enter volume size, maximum 200G, or leave it as it is and create a data volume later
7. Click on `Create`

## Connect to the instance

Use your common SSH method to connect to your instance. You can find the public IP address by going to [https://cloud.oracle.com/compute/instances](https://cloud.oracle.com/compute/instances) and choose the instance you have just created. In the details page, you will see you public IP address on the right hand side.

## Install `Docker`

1. Following the official guide at [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/), make sure to choose `arm64` during the process.
2. Download the latest v2 docker compose CLI at [https://github.com/docker/compose-cli#compose-v2-aka-local-docker-compose](https://github.com/docker/compose-cli#compose-v2-aka-local-docker-compose), after that run `docker compose` to make sure it is working

## Install `Mastodon`

1. Clone this repo, `git clone https://github.com/xmflsct/oracle-arm-mastodon.git`
2. Go into `mastodon` folder and clone the Mastodon repo, `cd mastodon` and `git clone https://github.com/tootsuite/mastodon.git`
3. Checkout to latest version of Mastodon, `git checkout tags/v3.4.1`
4. To use full-text search and optimising for Chinese content, follow [instructions](https://docs.joinmastodon.org/admin/optional/elasticsearch/#:~:text=Chinese%20search%20optimization) of how to update source code before building the docker image
5. Go back to the root folder by `cd ..`
6. Update `./caddy/Caddyfile` to your domain name. Before Caddy can request for SSL certificates successfully, make sure your domain is not behind Cloudflare or such at this moment
7. Run `docker compose build`
8. If build is successful, you can run `docker compose up -d` now!
