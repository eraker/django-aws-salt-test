ladder:
  user.present:
    - fullname: Ladder Wittgenstein

/home/ladder/.bashrc:
  file.managed:
    - source: salt://bashrc
    - user: ladder
    - group: ladder
    - mode: 644