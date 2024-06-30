if type -q ssh-agent
  set SSH_AGENT_SOCK "$HOME/.ssh/ssh_auth_sock"

  if type -q pgrep
    if not pgrep -u "$USER" ssh-agent > /dev/null
      rm -v "$SSH_AGENT_SOCK"
    end
  end

  if not test -S "$SSH_AGENT_SOCK"
    ssh-agent -c | \grep setenv | eval
    ln -sf "$SSH_AUTH_SOCK" "$SSH_AGENT_SOCK"
    set -U SSH_AGENT_PID "$SSH_AGENT_PID"
  end

  set -U SSH_AUTH_SOCK "$SSH_AGENT_SOCK"
end

# output of `ssh-agent -c` for reference:
# setenv SSH_AUTH_SOCK /tmp/ssh-XXXXXXp9xkrZ/agent.126231;
# setenv SSH_AGENT_PID 126232;
# echo Agent pid 126232;
