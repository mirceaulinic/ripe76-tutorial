oc_ntp_netconfig_test:
  file.managed:
    - name: /tmp/__salt_ntp_{{ opts.id }}.txt
    - source: salt://ntp/templates/init.jinja
    - template: jinja
    - {{ salt.pillar.get('openconfig-system') }}
file.read:
  module.run:
    - path: /tmp/__salt_ntp_{{ opts.id }}.txt
file.remove:
  module.run:
    - path: /tmp/__salt_ntp_{{ opts.id }}.txt
