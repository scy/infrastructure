support for HTTPS repositories:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
Docker APT repository:
  pkgrepo.managed:
    - name: deb https://apt.dockerproject.org/repo debian-jessie main
    - file: /etc/apt/sources.list.d/docker.jessie.list
    - key_url: file:///etc/infrastructure/keys/public/apt.docker.asc
Docker package:
  pkg.installed:
    - pkgs:
      - docker-engine
