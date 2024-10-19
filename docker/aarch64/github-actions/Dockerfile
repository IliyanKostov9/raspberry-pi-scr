FROM ubuntu:24.04

WORKDIR actions-runner

ENV VERSION = 2.139.1
ENV SHA_RUNNER="03d993c65e0c4daa5e3bf5a5a35ba356f363bdb5ceb6b5808fd52fdb813dd8e8"
ENV ARCH = arm64
ENV REPOSITORY = ?
ENV TOKEN = ?

RUN mkdir actions-runner && cd actions-runner && \
    curl -o actions-runner-linux-${ARCH}-${VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-linux-${ARCH}-${VERSION}.tar.gz && \
    echo "${SHA_RUNNER}  actions-runner-linux-${ARCH}-${VERSION}.tar.gz" | shasum -a 256 -c 

RUN tar xzf ./actions-runner-linux-${ARCH}-${VERSION}.tar.gz
RUN ./config.sh --url https://github.com/${REPOSITORY} --token ${TOKEN}

CMD["./run.sh"]
