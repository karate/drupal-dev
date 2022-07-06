### CLI tools for local Drupal development

- `docker/` directory contains [`docker-compose`](https://docs.docker.com/compose/) files to run Drupal 7 and 8 instances
with `apache`, `php` and `MySQL` containers.

- `tmux.sh` is a script that runs tmux and creates windows and panes running `docker`, `vim`, etc.
![tmux screenshot](https://github.com/karate/drupal-dev/blob/main/tmux.png?raw=true)
(my `tmux` configuration can be found here: https://github.com/karate/dotfiles/blob/master/tmux/.tmux.conf)
