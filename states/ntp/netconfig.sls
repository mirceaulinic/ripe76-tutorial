oc_ntp_netconfig:
  netconfig.managed:
    - template_name: salt://ntp/templates/init.jinja
    - {{ salt.pillar.get('openconfig-system') }}
