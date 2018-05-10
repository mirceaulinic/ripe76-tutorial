triggered NTP state:
  local.state.sls:
    - tgt: {{ data.host }}
    - arg:
      - ntp
