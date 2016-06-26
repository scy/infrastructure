use SHA512 as hashing algorithm:
  file.append:
    - name: /etc/salt/minion.d/generated.conf
    - makedirs: True
    - text:
      - "hash_type: sha512"
