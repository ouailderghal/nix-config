{ config, pkgs, ...}:
let
  # TODO: use localVariables and sessionVariables instead of inline declaration.
  init = ''
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
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    shellAliases = aliases;
    initExtra = init;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "pass" ];
      theme = "half-life";
    };

    history.size = historySize;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
