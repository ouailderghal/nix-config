{ config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;

    extraConfig = ''
      # change prefix key
      set-option -g prefix C-s
      unbind-key C-b 
      bind-key C-s send-prefix

      # default shell and terminal
      set-option -g default-shell ${pkgs.zsh}/bin/zsh
      set-option -g default-terminal "xterm-256color"

      # start window count from 1
      set-option -g base-index 1

      # enable mouse mode
      set-option -g mouse on

      # faster escape when using vim
      set-option -g escape-time 20

      # enable clipboard
      set-option -g set-clipboard on

      # split windows
      bind-key v split-window -h
      bind-key h split-window -v

      # swap windows
      bind-key -n C-S-Left swap-window -t -1\; select-window -t -1
      bind-key -n C-S-Right swap-window -t +1\; select-window -t +1

      # move between panes
      bind-key -n M-Up select-pane -U
      bind-key -n M-Down select-pane -D
      bind-key -n M-Left select-pane -L
      bind-key -n M-Right select-pane -R

      # move between windows
      bind-key -n S-Left previous-window
      bind-key -n S-Right next-window

      # config file reload
      bind-key r source-file $HOME/.config/tmux/tmux.conf \; display-message "Config file reloaded."

      # Status Bar
      set -g status-justify left
      set -g status-interval 60
      set -g status-left-length 50
      set -g status-right '#{battery_status_bg} BAT: #{battery_icon} #{battery_percentage} | %a %h-%d %H:%M '

      run-shell ${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible/sensible.tmux
      run-shell ${pkgs.tmuxPlugins.yank}/share/tmux-plugins/yank/yank.tmux
      run-shell ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/resurrect.tmux
      run-shell ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux
    '';
  };
}
