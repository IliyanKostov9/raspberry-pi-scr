export RUNNER_VERSION=$(curl -X 'GET' https://code.forgejo.org/api/v1/repos/forgejo/runner/releases/latest | jq .name -r | cut -c 2-)

sudo docker run --rm code.forgejo.org/forgejo/runner:${RUNNER_VERSION} forgejo-runner --version forgejo-runner version 3.5.1

echo "Input Name for the forgejo app:"
read NAME

echo "Input Token for the forgejo app:"
read TOKEN

echo "What number is the runner?"
read RUNNER_NUM

sudo docker run -v /var/run/docker.sock:/var/run/docker.sock  -v $PWD:/data --rm code.forgejo.org/forgejo/runner:${RUNNER_VERSION} forgejo-runner register --no-interactive --token $TOKEN --name $NAME --instance https://codeberg.org

sudo docker run -v /var/run/docker.sock:/var/run/docker.sock  -v $PWD:/data --rm code.forgejo.org/forgejo/runner:${RUNNER_VERSION} forgejo-runner generate-config > config.yml

sudo mkdir -p /opt/forgejo-runner/$NAME/$RUNNER_NUM
sudo mv ./.runner /opt/forgejo-runner/$NAME/$RUNNER_NUM
sudo mv ./config.yml /opt/forgejo-runner/$NAME/$RUNNER_NUM
sudo chown -R 1000:1000 /opt/forgejo-runner/$NAME/$RUNNER_NUM

echo "Runner setup done! Now you can run docker-compose up -d to start the containers"
