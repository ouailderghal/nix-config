{ config, pkgs, ...}:
let
  aliases = {
    nrs = "sudo nixos-rebuild switch";

    ls = "ls --color=auto";
    sl = "ls";
    l = "ls -lh";
    ll = "ls -lah";
    q = "exit";
    e = "nvim";
    m = "${pkgs.neomutt}/bin/neomutt";
    rf = "rm -rf";
    systemctl = "sudo systemctl";
    ss = "sudo systemctl";
    open = "xdg-open";
    o = "xdg-open";
    pinger = "ping -c 3 archlinux.org";
    copy = "xclip -selection c";

    g = "git";
    gl = "git log --oneline --decorate";
    ga = "git add";
    gaa = "git add -A";
    gcm = "git commit -m";
    gs = "git status";
    gss = "git status -s";
    gb = "git branch";
    gc = "git checkout";
    gcb = "git checkout -b";
    gp = "git push origin main";

    t = "tmux";
    ta = "tmux a";
    tns = "tmux new-session -s";
    tat = "tmux attach -t";
    tls = "tmux list-sessions";
    tks = "tmux kill-session -t";
    tkserver = "tmux kill-server";

    d = "docker";
    tf = "terraform";
    dc = "docker compose";
    va = "vagrant";
    an = "ansible";
    anp = "ansible-playbook";
  };

  historySize = 10000;
in 
  {
    programs.bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = aliases;
      historyFile = "${config.xdg.dataHome}/bash/history";
      historyFileSize = historySize;
      bashrcExtra = ''
        export BROWSER=${pkgs.brave}/bin/brave
        export MANPATH="/usr/local/man:$MANPATH"
        export LANG=en_US.UTF-8
        export ARCHFLAGS="-arch x86_64"

        # If not running interactively, don't do anything
        shopt -s globstar
        [[ $- != *i* ]] && return

        PATH=$PATH:"/usr/local/bin"
        PATH=$PATH:"$HOME/.local/bin"

        # Better colors
        eval $(dircolors -b)

        # Editor
        [[ -n $SSH_CONNECTION ]] && export EDITOR='nvim' || \
        export EDITOR='nvim'

        # Scripts
        export PATH="$PATH:$HOME/.scripts"

        # Go
        export PATH="$PATH:/usr/local/go/bin"
        export GOPATH="$HOME/go"
        export GOBIN="$GOPATH/bin"
        PATH=$PATH:"$GOBIN"

        # Prompt
        if declare -f __git_ps1 >/dev/null 2>&1; then
        PS1='\[\e[1;31m\]\u\[\e[0;0m\]\[\e[0;33m\]@\[\e[0;36m\]\h\[\e[0;0m\]\[\e[0;33m\]|\[\e[0;0m\]\t>\W\[\e[0;32m\]$(__git_ps1 "(%s)")\[\e[0;0m\]$'
        else
        PS1='\[\e[1;31m\]\u\[\e[0;0m\]\[\e[0;33m\]@\[\e[0;36m\]\h\[\e[0;0m\]\[\e[0;33m\]|\[\e[0;0m\]\t>\W\[\e[0;0m\]$'
        fi

        export PATH
        export PS1
      '';
    };
  }
