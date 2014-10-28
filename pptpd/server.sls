# vim: sts=2 ts=2 sw=2 expandtab autoindent
{% from "pptpd/map.jinja" import pptpd with context %}

"/etc/pptpd.conf":
  file.managed:
    - source: salt://pptpd/files/pptpd.conf
    - template: jinja
    - context: 
        pptpd: {{ pptpd.get("/etc/pptpd.conf", "") }}

"/etc/ppp/pptpd-options":
  file.managed:
    - source: salt://pptpd/files/pptpd-options.conf
    - template: jinja
    - context: 
        pptpd: {{ pptpd.get("/etc/ppp/pptpd-options","") }}

"/etc/ppp/chap-secrets":
  file.managed:
    - source: salt://pptpd/files/chap-secrets.conf
    - template: jinja
    - context: 
        pptpd: {{ pptpd.get("/etc/ppp/chap-secrets","") }}
