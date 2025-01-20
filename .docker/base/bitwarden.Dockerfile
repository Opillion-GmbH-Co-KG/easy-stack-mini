FROM vaultwarden/server:latest

WORKDIR /usr/local/bin
# this installs the bitwarden cli for test reasons
RUN apt update && apt install -y curl unzip libsecret-1-0 jq

RUN export VER=$(curl -H "Accept: application/vnd.github+json" https://api.github.com/repos/bitwarden/clients/releases | jq  -r 'sort_by(.published_at) | reverse | .[].name | select( index("CLI") )' | sed 's:.*CLI v::' | head -n 1) && \
  curl -LO "https://github.com/bitwarden/clients/releases/download/cli-v{$VER}/bw-linux-{$VER}.zip" \
  && unzip *.zip && chmod +x ./bw \

RUN bw --version

WORKDIR /
