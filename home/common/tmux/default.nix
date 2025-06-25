{ config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "s";
    baseIndex = 1;
    escapeTime = 0;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      battery
      continuum
    ];

    extraConfig = ''
      set-option -g default-shell ${pkgs.bash}/bin/bash
      set-option -g default-terminal "xterm-256color"
      set-option -g default-command "bash -i"
      set-option -ga terminal-overrides ",xterm-256color:Tc"
      set-option -g mouse on
      set-option -g escape-time 20
      set-option -g set-clipboard on

      bind-key v split-window -h
      bind-key h split-window -v

      bind-key -n C-S-Left swap-window -t -1\; select-window -t -1
      bind-key -n C-S-Right swap-window -t +1\; select-window -t +1

      bind-key -n S-Left previous-window
      bind-key -n S-Right next-window

      bind-key -n M-Up select-pane -U
      bind-key -n M-Down select-pane -D
      bind-key -n M-Left select-pane -L
      bind-key -n M-Right select-pane -R

      bind-key r source-file $HOME/.config/tmux/tmux.conf \; display-message "Config file reloaded."

      set -g status-justify left
      set -g status-interval 60
      set -g status-left-length 50
      set -g status-right "#{battery_status_bg} #{battery_percentage} | %d/%m/%y | %H:%M "

      run-shell ${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible/sensible.tmux
      run-shell ${pkgs.tmuxPlugins.yank}/share/tmux-plugins/yank/yank.tmux
      run-shell ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/resurrect.tmux
      run-shell ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux
      run-shell ${pkgs.tmuxPlugins.continuum}/share/tmux-plugins/continuum/continuum.tmux
    '';
  };
}
