::  simple leaderboard
::
::::  /===/app/lead/hoon
  ::
!:
|%
+=  axle
  $%  [%0 p=(map @t @ud)]
  ==
+=  diff-contents                                     ::  subscription frame
  $%  [%json p=json]                                  ::  json
  ==                                                  ::
+=  kiss
  $%  [%new-lead name=cord]                           ::  new leader
      [%add-lead name=cord]                           ::  add to leader
  ==
+=  move  [bone card]                                 ::  output operation
+=  card  $%  [%diff diff-contents]                     
          ==
--
::
|_  [bow=bowl:gall vat=axle]
::
++  prep
  |=  old=(unit)
  [~ +>.$]
::
++  peer
  |=  [pax=path]
  ^-  [(list move) _+>]
  ?~  pax
    [`(list move)`[[ost.bow %diff %json vat-json] ~] +>.$]
  :_  +>.$
  :_  ~
  ?+    -.pax
      ~_(leaf+"you need to specify a path" ~|(%not-found !!))
    %data  [ost.bow %diff %json (frond:enjs:format %conn %b &)]
  ==
::
++  vat-json
^-  json
  :-  %o
  %-  ~(urn by p.vat)
    |=  [k=@t v=@ud]
  [%n (scot %ud v)]
::
++  deliver
  |=  pkg=[@tas json]
  %+  turn  (prey:pubsub:userlib /data bow)
  |=  [ost=bone his=ship pax=path]
  [ost %diff %json (frond:enjs:format pkg)]
::
++  poke-json
  |=  [jon=json]
  ~&  poked+jon
  ^-  [(list move) _+>]
  =+  ^=  jop
      ^-  kiss
      %-  need  %.  jon
      =>  dejs-soft:format  %-  of
      :~  [%new-lead so]
          [%add-lead so]
      ==
  ?-  -.jop
    %new-lead
      ?:  (~(has by p.vat) +.jop)
        ~_  [%leaf "That name is already in the leaderboard."]
        ~|(%not-new !!)
      =.  p.vat
        (~(put by p.vat) name.jop 0)
      :_  +>.$
      (deliver %upd-lead (frond:enjs:format name.jop [%n (scot %ud 0)]))
    %add-lead
      =+  ledr=(~(get by p.vat) name.jop)
      ?~  ledr
        ~_  [%leaf "That name is not in the leaderboard."]
        ~|(%not-new !!)
      =+  scor=(need ledr)
      =.  p.vat
        %-  ~(urn by p.vat)
        |=  [k=@t v=@ud]
          ?:(=(k name.jop) +(v) v)
      :_  +>.$
      (deliver %upd-lead (frond:enjs:format name.jop [%n (scot %ud (add scor 1))]))
  ==
::
--
