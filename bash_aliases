echo "Custom bash aliases loaded."

# AWS aliases
alias aws_login='`aws ecr get-login --region eu-west-1`'

# Docker aliases
alias docker_rmi='docker rmi -f $(docker images -q -a)'
alias docker_rmc='docker rm -f $(docker ps -a -q)'
alias docker_rmv='docker volume rm $(docker volume ls -q -f dangling=true)'
alias docker_stats='docker stats $(docker ps --format={{.Names}})'
alias docker_stop='docker stop $(docker ps -a -q)'
alias docker_reset='docker_stop;docker_rmc;docker_rmi;docker_rmv;'
alias dclear="docker stop \$(docker ps -aq); docker rm \$(docker ps -aq)"
function dsql {
  docker exec -it $1 mysql -uroot -padmin
}

function dbash {
  docker exec -it $1 bash
}

# Naivation aliases
alias dev='cd /home/developer/development'
alias ..='cd ..'
alias ...='cd ../../'

# Github aliases
alias g='git'
alias gs='git status'
alias gd='git diff '
alias gc='git checkout '
alias open='sensible-browser'
