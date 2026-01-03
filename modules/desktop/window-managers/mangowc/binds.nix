''
  # Essentials
  bind=SUPER+SHIFT,c,reload_config
  bind=SUPER+SHIFT,m,quit
  bind=SUPER,e,spawn,nautilus
  bind=SUPER,n,switch_layout
  bind=SUPER,q,killclient,
  bind=SUPER,space,spawn_shell,noctalia-shell ipc call launcher toggle
  bind=SUPER,t,spawn,foot

  # Navigation
  bind=SUPER,Left,focusdir,left
  bind=SUPER,Down,focusdir,down
  bind=SUPER,Up,focusdir,up
  bind=SUPER,Right,focusdir,right

  # Move window
  bind=SUPER+SHIFT,Left,exchange_client,left
  bind=SUPER+SHIFT,Down,exchange_client,down
  bind=SUPER+SHIFT,Up,exchange_client,up
  bind=SUPER+SHIFT,Right,exchange_client,right

  # Resize window
  bind=SUPER+CTRL,Left,resizewin,-50,+0
  bind=SUPER+CTRL,Down,resizewin,+0,+50
  bind=SUPER+CTRL,Up,resizewin,+0,-50
  bind=SUPER+CTRL,Right,resizewin,+50,+0

  # Switch window status
  bind=ALT,Tab,toggleoverview,
  bind=SUPER+SHIFT,f,togglefullscreen,
  bind=SUPER,f,togglemaximizescreen,
  bind=SUPER,g,toggleglobal,
  bind=SUPER,s,toggle_scratchpad
  bind=SUPER,v,togglefloating,

  # Scrolling layout
  bind=SUPER,c,centerwin,
  bind=SUPER,r,switch_proportion_preset,

  # Tag navigation
  bind=SUPER,1,view,1,0
  bind=SUPER,2,view,2,0
  bind=SUPER,3,view,3,0
  bind=SUPER,4,view,4,0
  bind=SUPER,5,view,5,0
  bind=SUPER,6,view,6,0
  bind=SUPER,7,view,7,0
  bind=SUPER,8,view,8,0
  bind=SUPER,9,view,9,0

  # Move window to tag
  bind=SUPER+SHIFT,1,tag,1,0
  bind=SUPER+SHIFT,2,tag,2,0
  bind=SUPER+SHIFT,3,tag,3,0
  bind=SUPER+SHIFT,4,tag,4,0
  bind=SUPER+SHIFT,5,tag,5,0
  bind=SUPER+SHIFT,6,tag,6,0
  bind=SUPER+SHIFT,7,tag,7,0
  bind=SUPER+SHIFT,8,tag,8,0
  bind=SUPER+SHIFT,9,tag,9,0

  # Monitor navigation
  bind=ALT,Left,focusmon,left
  bind=ALT,Right,focusmon,right

  # Move window to monitor
  bind=ALT+SHIFT,Left,tagmon,left
  bind=ALT+SHIFT,Right,tagmon,right

  # System
  bind=NONE,XF86AudioPlay,spawn_shell,playerctl play-pause
  bind=NONE,XF86AudioNext,spawn_shell,playerctl next
  bind=NONE,XF86AudioPrev,spawn_shell,playerctl previous
  bind=NONE,XF86AudioRaiseVolume,spawn_shell,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
  bind=NONE,XF86AudioLowerVolume,spawn_shell,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  bind=NONE,XF86AudioMute,spawn_shell,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  bind=NONE,XF86AudioMicMute,spawn_shell,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
  bind=NONE,XF86MonBrightnessUp,spawn_shell,brightnessctl set +5%
  bind=NONE,XF86MonBrightnessDown,spawn_shell,brightnessctl set 5%-

  # Trackpad
  gesturebind=NONE,Left,3,focusdir,left
  gesturebind=NONE,Right,3,focusdir,right
  gesturebind=NONE,Up,4,toggleoverview

  # Mouse
  axisbind=SUPER,UP,viewtoleft_have_client
  axisbind=SUPER,DOWN,viewtoright_have_client
  mousebind=NONE,btn_left,toggleoverview,1
  mousebind=NONE,btn_right,killclient,0
  mousebind=SUPER,btn_left,moveresize,curmove
  mousebind=SUPER,btn_right,moveresize,curresize
''
