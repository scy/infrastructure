infrastructure repository:
  git.latest:
    - name: git://github.com/scy/infrastructure.git
    - target: /etc/infrastructure
    - user: root
    - unless:
      # scydev, for example, supplies /etc/infrastructure via VirtualBox shared folders
      - grep -q '^none /etc/infrastructure vboxsf ' /proc/mounts
