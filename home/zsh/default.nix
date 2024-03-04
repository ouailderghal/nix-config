{ config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "half-life";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    shellAliases = {
      nrs = "sudo nixos-rebuild switch";

      ls = "ls --color=auto";
      sl = "ls";
      l = "ls -lh";
      ll = "ls -lah";
      q = "exit";
      e = "nvim";
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
      gp = "git push";

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

    initExtra = ''
    export MANPATH="/usr/local/man:$MANPATH"
    export BROWSER="${pkgs.brave}/bin/brave"
    export ARCHFLAGS="-arch x86_64"

    # Set editor on local and remote connections
    if [[ -n $SSH_CONNECTION ]]; then
      export EDITOR='vim'
    else
      export EDITOR='nvim'
    fi
    
    # Load Go binaries
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    path+="$GOBIN"
    '';
  };
}
