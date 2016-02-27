{% set app_dir = "/var/www/ladder" %}
remove_apache:
    pkg.purged:
        - name: apache2

nginx-full:
  pkg.installed

/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://webserver/nginx.conf
    - require:
      - pkg: nginx-full

/etc/nginx/sites-enabled/default:
  file:
    - absent
    - require:
      - pkg: nginx-full


/etc/nginx/sites-enabled/ladder.conf:
  file:
    - managed
    - source: salt://webserver/ladder.conf
    - require:
      - pkg: nginx-full

{% if not salt['file.directory_exists' ]('/var/www') %}
/var/www:
  file.directory:
    - user:  ladder
    - name:  /var/www
    - group:  ladder
    - mode:  554
{% else %}
  cmd.run:
    - name: echo "Static directory exists"
{% endif %}

{% if not salt['file.directory_exists' ]('{{ app_dir }}') %}
{{ app_dir }}:
  file.directory:
    - user:  ladder
    - name:  {{ app_dir }}
    - group:  ladder
    - mode:  554
{% else %}
  cmd.run:
    - name: echo "Static directory exists"
{% endif %}

{% if not salt['file.directory_exists' ]('{{ app_dir }}/static') %}
{{ app_dir }}/static:
  file.directory:
    - user:  ladder
    - name:  {{ app_dir }}/static
    - group:  ladder
    - mode:  554
{% else %}
  cmd.run:
    - name: echo "Static directory exists"
{% endif %}

{% if not salt['file.directory_exists' ]('{{ app_dir }}/media') %}
{{ app_dir }}/media:
  file.directory:
    - user:  ladder
    - name:  {{ app_dir }}/media
    - group:  ladder
    - mode:  554
{% else %}
  cmd.run:
    - name: echo "Media directory exists"
{% endif %}
