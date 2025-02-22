set -g status-style "bg=default,fg=default"
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-256color:Tc"
set-option -a terminal-features 'alacritty:RGB'
set -sg escape-time 0
set -g prefix C-b
unbind r
bind r source-file ~/.tmux.conf

unbind x
bind x kill-pane

unbind %
bind / split-window -h
unbind '"'
bind - split-window -v

set -g base-index 1
setw -g pane-base-index 1

unbind r
bind r source-file ~/.tmux.conf

bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5
bind -r m resize-pane -Z

set -g mouse on
set-option -g status-position top

set-window-option -g mode-keys vi

bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

unbind -T copy-mode-vi MouseDragEnd2Pane # don't exit copy mode after dragging with mouse

set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-resurrect' # tmux sessions persist after resart
set -g @plugin 'tmux-plugins/tmux-continuum'
# Auto-Saving

set -g @resurrect-capture-pane-contents 'on'
set -g @continuum-restore 'on'
set -g @continuum-save-interval '1'

set -g @plugin 'tmux-plugins/tpm'
run '~/.tmux/plugins/tpm/tpm'
