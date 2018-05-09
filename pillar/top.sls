base:
  '*':
    - ntp
  {{ opts.id }}:
    - {{ opts.id }}_pillar
