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
