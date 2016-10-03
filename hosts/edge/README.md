# How to set up `edge`, my home router

## Install Software

	sudo apt update && \
	sudo apt install git vim screen dnsmasq iptables iptables-persistent dnsutils tcpdump openssh-server

## Copy Configuration Files

	cd infrastructure/hosts/edge && \
	./deploy-config.sh
