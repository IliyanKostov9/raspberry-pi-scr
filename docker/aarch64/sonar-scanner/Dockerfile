FROM node:20-bookworm

ARG VERSION=6.1.0.4477
ARG ARCH="linux-aarch64"

RUN apt-get update && \ 
	apt-get install -y wget unzip coreutils && \
	wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${VERSION}-${ARCH}.zip && \
	unzip sonar-scanner-cli-${VERSION}-${ARCH}.zip && ls -1 -l && \
	mv sonar-scanner-${VERSION}-${ARCH}  /opt/sonar-scanner && \
	rm sonar-scanner-cli-${VERSION}-${ARCH}.zip 

ENV PATH="$PATH:/opt/sonar-scanner/bin"



