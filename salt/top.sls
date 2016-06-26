base:
  '*':
    - salt.sha512
    - salt.local-only
    - infra-repo
  'G@os:Debian':
    - default-packages.debian-utils
