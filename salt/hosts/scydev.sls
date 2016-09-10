add Vagrant user to Docker group:
  user.present:
    - name: vagrant
    - optional_groups:
      - docker
    - require:
      - pkg: Docker package
