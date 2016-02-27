{% set app_dir = "/var/www/ladder" %}
{% set SECRETS_LOCATION = salt['environ.get']('SECRETS_LOCATION') %}

mk_venv:
  virtualenv.managed:
    - name: {{ app_dir }}/venv
    - use_wheel: True
    - system_site_packages: False
    - requirements: salt://application/ladder/requirements.txt

venv_ownership:
  file.directory:
    - name: {{ app_dir }}/venv
    - user: ladder
    - group: ladder
    - follow_symlinks: False
    - recurse:
      - user

{{ app_dir }}/ladder:
    file.directory:
        - user: ladder
        - group: ladder
        - source: salt://application/ladder
        - recurse:
            - user
            - group
            - mode

{{ SECRETS_LOCATION }}:
  file:
    - managed
    - user: ladder
    - group: ladder
