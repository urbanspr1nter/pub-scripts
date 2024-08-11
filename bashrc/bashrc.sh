# Always start tmux when starting bash
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -t default || exec tmux new -s default && exit;
fi

alias vim=nvim

export EDITOR=vim

# 109 is the keyboard code for PageDown 
alias lg="/path/to/looking-glass-client -m 109"
alias auto-cpufreq-conf="sudo vim /etc/auto-cpufreq.conf"

# Don't use ifconfig anymore
alias ifconfig="echo 'You should use `ip addr` instead to find the IP address.'"
