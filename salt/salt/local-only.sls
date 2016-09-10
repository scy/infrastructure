only local Salt, no minion, no master:
  file.append:
    - name: /etc/salt/minion.d/generated.conf
    - makedirs: True
    - text:
      - "file_client: local"
      - "master: []"
      - "file_roots:"
      - "  base:"
      - "    - /etc/infrastructure/salt"
the salt-local command:
  file.managed:
    - name: /usr/local/bin/salt-local
    - user: root
    - group: root
    - mode: 0755
    - contents: |
        #!/bin/sh
        exec sudo salt-call --local --retcode-passthrough "$@"
