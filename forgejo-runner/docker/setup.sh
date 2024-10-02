export RUNNER_VERSION=$(curl -X 'GET' https://code.forgejo.org/api/v1/repos/forgejo/runner/releases/latest | jq .name -r | cut -c 2-)

docker run --rm code.forgejo.org/forgejo/runner:${RUNNER_VERSION} forgejo-runner --version
forgejo-runner version 3.5.1

echo "Input Name for the forgejo app:"
read NAME

echo "Input Token for the forgejo app:"
read TOKEN

docker run -v /var/run/docker.sock:/var/run/docker.sock  -v /home/pi/docker:/data --rm code.forgejo.org/forgejo/runner: forgejo-runner register --no-interactive --token $TOKEN --name $NAME --instance https://codeberg.org

docker run -v /var/run/docker.sock:/var/run/docker.sock  -v /home/pi/docker:/data --rm code.forgejo.org/forgejo/runner: forgejo-runner generate-config > config.yml

sudo mv ./.runner /opt/forgejo-runner
sudo mv ./config.yml /opt/forgejo-runner
sudo chown -R 1000:1000 /opt/forgejo-runner

echo "Runner setup done! Now you can run docker-compose up -d to start the containers"
