let
  # Direction keys
  l = "left";
  d = "down";
  u = "up";
  r = "right";

  # Commands
  fileManager = "nautilus";
  launcher = "noctalia-shell ipc call launcher toggle";
  terminal = "footclient";
in ''
  # Essentials
  bind=SUPER,e,spawn,${fileManager}
  bind=SUPER,space,spawn,${launcher}
  bind=SUPER,t,spawn,${terminal}
  bind=SUPER,l,spawn,noctalia-shell ipc call sessionMenu toggle
  bind=SUPER,q,killclient,
  bind=SUPER,tab,switch_layout
  bind=SUPER+SHIFT,c,reload_config
  bind=SUPER+SHIFT,m,quit
  bind=ALT,tab,toggleoverview,

  # Window state
  bind=SUPER,f,togglemaximizescreen,
  bind=SUPER,g,toggleglobal,
  bind=SUPER,v,togglefloating,
  bind=SUPER+SHIFT,f,togglefullscreen,

  # Scratchpad
  bind=SUPER,s,toggle_scratchpad
  bind=SUPER+SHIFT,s,minimized,
  bind=SUPER+CTRL,s,restore_minimized # TODO: Revisit this bind

  # Scroller layout
  bind=SUPER,r,switch_proportion_preset,
  bind=SUPER+SHIFT,r,set_proportion,1.0

  # Navigation (focus)
  bind=SUPER,${l},focusdir,left
  bind=SUPER,${d},focusdir,down
  bind=SUPER,${u},focusdir,up
  bind=SUPER,${r},focusdir,right

  # Move a window
  bind=SUPER+SHIFT,${l},exchange_client,left
  bind=SUPER+SHIFT,${d},exchange_client,down
  bind=SUPER+SHIFT,${u},exchange_client,up
  bind=SUPER+SHIFT,${r},exchange_client,right

  # Resize a window
  bind=SUPER+CTRL,${l},resizewin,-50,+0
  bind=SUPER+CTRL,${d},resizewin,+0,+50
  bind=SUPER+CTRL,${u},resizewin,+0,-50
  bind=SUPER+CTRL,${r},resizewin,+50,+0

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
  bind=SUPER,prior,viewtoleft,0 # PgUp
  bind=SUPER,next,viewtoright,0 # PgDn

  # Move a window to a tag
  bind=SUPER+SHIFT,1,tag,1,0
  bind=SUPER+SHIFT,2,tag,2,0
  bind=SUPER+SHIFT,3,tag,3,0
  bind=SUPER+SHIFT,4,tag,4,0
  bind=SUPER+SHIFT,5,tag,5,0
  bind=SUPER+SHIFT,6,tag,6,0
  bind=SUPER+SHIFT,7,tag,7,0
  bind=SUPER+SHIFT,8,tag,8,0
  bind=SUPER+SHIFT,9,tag,9,0
  bind=SUPER+SHIFT,prior,tagtoleft,0 # PgUp
  bind=SUPER+SHIFT,next,tagtoright,0 # PgDn

  # Monitors
  bind=ALT,${l},focusmon,left
  bind=ALT,${r},focusmon,right
  bind=ALT+SHIFT,${l},tagmon,left
  bind=ALT+SHIFT,${r},tagmon,right

  # Mouse button binds
  mousebind=SUPER,btn_left,moveresize,curmove
  mousebind=SUPER,btn_right,moveresize,curresize
  mousebind=NONE,btn_middle,togglemaximizescreen,0

  # Scroll wheel binds
  axisbind=SUPER,up,viewtoleft,0
  axisbind=SUPER,down,viewtoright,0
  axisbind=SUPER+SHIFT,up,tagtoleft,0
  axisbind=SUPER+SHIFT,down,tagtoright,0

  # System
  bind=NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
  bind=NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  bind=NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  bind=NONE,XF86AudioMicMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
  bind=NONE,XF86AudioPlay,spawn,playerctl play-pause
  bind=NONE,XF86AudioStop,spawn,playerctl stop
  bind=NONE,XF86AudioPrev,spawn,playerctl previous
  bind=NONE,XF86AudioNext,spawn,playerctl next
  bind=NONE,XF86MonBrightnessUp,spawn,brightnessctl set +5%
  bind=NONE,XF86MonBrightnessDown,spawn,brightnessctl set 5%-
''
