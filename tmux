# Changing the Prefix
unbind C-b
set -g prefix C-a

# Pane switching with Alt+arrow
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Activity monitoring
setw -g monitor-activity on
set -g visual-activity on

# Current window highlighting
set-window-option -g window-status-current-bg yellow

# Pane switching using mouse
set-option -g mouse on

