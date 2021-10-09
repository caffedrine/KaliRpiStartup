session_name='htb'

tmux has-session -t $session_name
if [ $? != 0 ]
then
    #########################
    # Session/Window 0
    #########################
    cd ~
    tmux new-session               -ds $session_name
    tmux set-window-option          -t $session_name     allow-rename off
    tmux rename-window              -t $session_name:0   OpenVPN

    # Pane 0.1
    #tmux split-window     -h -p 25 -t $session_name:0
    tmux split-window      		 -h -t $session_name:0
	
	# Pane 0.2
    tmux split-window      	     -v -t $session_name:0

	# Select big panel by default
	tmux select-pane                -t 0

    #########################
    # Window 1
    #########################
    tmux new-window                 -t $session_name:1
    tmux set-window-option          -t $session_name:1   allow-rename off
    tmux rename-window              -t $session_name:1   BackgroundScan

    # Pane 1.1
    tmux split-window      		 -h -t $session_name:1
	
	# Pane 1.2
    tmux split-window      	 	 -v -t $session_name:1

	# Select big panel by default
	tmux select-pane                -t 0

    #########################
    # Window 2
    #########################
    tmux new-window                 -t $session_name:2
    tmux set-window-option          -t $session_name:2   allow-rename off
    tmux rename-window              -t $session_name:2   Workspace


    # Pane 2.1
    tmux split-window      		 -h -t $session_name:2
	
	# Pane 2.2
    tmux split-window      	 	 -v -t $session_name:2

	# Select big panel by default
	tmux select-pane                -t 0


    #########################
    # Select Pane 0.0
    #########################
    tmux select-window              -t $session_name:0
    tmux select-pane                -t 0
fi

tmux attach -t $session_name
