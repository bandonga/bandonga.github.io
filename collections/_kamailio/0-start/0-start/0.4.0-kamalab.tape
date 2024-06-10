Require tmux

Output "0.4.0-kamalab.gif"


Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 1600
#Set PlaybackSpeed 0.5


Hide
  Type "cd ~/git/marcelofpfelix/kamalab" Enter
  Type "tmux -L test new-session --" Enter
  Type "tmux split-window -d -v -- && \" Enter
  Type "tmux split-window -d -h -- && \" Enter
  Type "tmux set status && \" Enter
  Type 'tmux setw pane-border-style "fg=0" && \' Enter
  Type 'tmux setw pane-active-border-style "fg=0"' Enter
  Sleep 0.5
  Ctrl+L
  Sleep 1
Show

Type "make" Sleep 500ms Enter Enter

Sleep 10

# tmux bind to switch to next pane
Ctrl+B
Type o

Sleep 1
Type "make watch" Sleep 500ms Enter
Sleep 1

# tmux bind to switch to next pane
Ctrl+B
Type o

Sleep 1
Type "sipexer 127.0.0.2" Sleep 500ms Enter
Sleep 3
