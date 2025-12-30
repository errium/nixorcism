''
  # keyboard
  repeat_rate=25
  repeat_delay=600
  numlockon=0
  xkb_rules_layout=us

  # Trackpad
  # need relogin to make it apply
  disable_trackpad=0
  tap_to_click=1
  tap_and_drag=1
  drag_lock=1
  trackpad_natural_scrolling=0
  disable_while_typing=1
  left_handed=0
  middle_button_emulation=0
  swipe_min_threshold=1

  # mouse
  # need relogin to make it apply
  mouse_natural_scrolling=0

  # Mouse Button Bindings
  # NONE mode key only work in ov mode
  mousebind=SUPER,btn_left,moveresize,curmove
  mousebind=NONE,btn_middle,togglemaximizescreen,0
  mousebind=SUPER,btn_right,moveresize,curresize
  mousebind=NONE,btn_left,toggleoverview,1
  mousebind=NONE,btn_right,killclient,0

  # Axis Bindings
  axisbind=SUPER,UP,viewtoleft_have_client
  axisbind=SUPER,DOWN,viewtoright_have_client
''
