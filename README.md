# docker-tastebin

This is a Docker image for [Tastebin](https://github.com/andreineculau/tastebin), an improved version of Hastebin.

## Get the image

You can download a pre-built image from [Docker Hub](https://hub.docker.com/r/andreipoe/tastebin/):

```bash
docker pull andreipoe/tastebin
```

Alternatively, you can build a copy yourself from [source](https://github.com/andreipoe/docker-tastebin):

```bash
git clone https://github.com/andreipoe/docker-tastebin.git
cd docker-tastebin
docker build -t andreipoe/tastebin .
```

## Run the image

The recommended way to run the image is:

```bash
docker run -d --name tastebin \
    --restart unless-stopped \
    -p 127.0.0.1:13000:3000 \
    -v /data/tastebin/tastes:/app/tastes \
    -v /data/tastebin/config/config.coffee:/app/config.coffee \
    andreipoe/tastebin
```

Then, run a reverse proxy to forward from your domain to `127.0.0.1:13000`.

### Configuration

The two `-v` parameters define where your configurations is stored:

- `-v /path/to/tastes:/app/tastes`: Store your pastes ("tastes") in `/path/to/tastes` on the host.
- `-v /path/to/config.coffee:/app/config.coffee`: Path to your custom configuration file. If you want to customise `config.coffee`, start from [the default](https://github.com/andreineculau/tastebin/raw/master/config.coffee). This paramter is optional; if you omit it, the default will be used

