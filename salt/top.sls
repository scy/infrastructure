base:
  '*':
    - salt.sha512
    - salt.local-only
  'G@os:Debian':
    - default-packages.debian-utils
