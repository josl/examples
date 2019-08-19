::  Simple social network
::
::::  /===/app/mesh/hoon
  ::
/-  mesh
[. mesh]
!:
|%
+=  move  [bone card]
+=  card  $%  [%peer wire dock path]
              [%pull wire dock $~]
              [%diff diff-contents]
          ==
+=  diff-contents  $%  [%mesh-friends color friends]
                       [%mesh-network color network]
                   ==
--
::
|_  [bow=bowl:gall [col=color net=network]]                  ::<  color, social net.
::
::++  prep  _`.
++  poke-mesh-color
  |=  col=color
  ^-  [(list move) _+>.$]
  =.  ^col  col
  ~&  mesh+'Color set! Notifying subscribers:'
  ~&  mesh+color+col
  [spam +>.$]
::
++  poke-mesh-friend
  |=  fen=friend
  ^-  [(list move) _+>.$]
  ~&  :-  %mesh
    (crip (weld (weld "Friending " (scow %p fen)) "!"))
  :_  +>.$
  :_  ~
  :*  ost.bow
      %peer
      /subscribe
      [fen %mesh]
      /mesh-friends
  ==
::
++  reap
  |=  [wire err=(unit tang)]
  ^-  [(list move) _+>.$]
  ?^  err  (mean u.err)
  ~!  +<.reap
  =.  net
    =/  my-net  (~(get ju net) our.bow)
    ?:  (~(has by my-net) src.bow)
      net
    =.  my-net  (~(put by my-net) src.bow '')
    (~(put by net) our.bow my-net)
  ~&  mesh+'Friend subscribe successful!'
  ~&  mesh+ship+src.bow
  [spam +>.$]
::
++  coup
  |=  [wire err=(unit tang)]
  ^-  [(list move) _+>.$]
  ?^  err  (mean u.err)
  [~ +>.$]
::
++  diff-mesh-friends
  |=  [wir=wire col=color fes=friends]
  ^-  [(list move) _+>.$]
  ~&  mesh+diff+'Network update!'
  ~&  mesh+diff+[source+src.bow color+col friends+fes]
  =+  old-net=net
  =.  net  (~(put by net) src.bow fes)
  =.  net
    =/  my-net  (~(get ju net) our.bow)
    ?.  (~(has by my-net) src.bow)  net
    =.  my-net  (~(put by my-net) src.bow col)
    (~(put by net) our.bow my-net)
  ?:  =(net old-net)  [~ +>.$]
  [spam +>.$]
::
++  spam
  ^-  (list move)
  %+  murn  ~(tap by sup.bow)
  |=  [ost=bone shp=ship pax=path]
  %+  bind  ~+((peek shp pax))
  |=(dif=diff-contents [ost %diff dif])
::
++  peek
  |=  [src=ship pax=path]
  ^-  (unit diff-contents)
  ?~  pax   ~
  ?+  i.pax  ~
    %web
      `(peek-web src t.pax)
    %mesh-friends
      `(peek-mesh-friends src t.pax)
  ==
::
++  peek-web
  |=  ^
  [%mesh-network col net]
++  peek-mesh-friends
  |=  ^
  :-  %mesh-friends
  [col (~(get ju net) our.bow)]
::
++  peer-web
  |=  pax=path
  ^-  [(list move) _+>.$]
  ~&  pax
  [[ost.bow %diff (peek-web src.bow pax)]~ +>.$]
::
++  peer-mesh-friends
  |=  pax=path
  ^-  [(list move) _+>.$]
  ~&  mesh+'Someone friended you!'
  ~&  mesh+ship+src.bow
  :_  +>.$
  :_  ~
  :*  ost.bow
      %diff
      (peek-mesh-friends src.bow pax)
  ==
::
--
