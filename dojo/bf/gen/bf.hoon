::    Brainfuck in Hoon. Esoception.
::
::::  /hoon/bf/gen
  ::
/-    sole
[sole]
!:
:-  %ask
|=  $:  ^
        {input/(list @) in/@ $~}
        $~
    ==
^-  (sole-result {$noun (list @)})
=<  bf
::
::::  ~haptem-fopnys, ~fyr
  ::
|%
++  bf
  =+  [ip=0 current=0 left=(reap 0 0) right=(reap 30 0)]
  |-  ^-  (sole-result {$noun (list @)})
  ?:  =(ip (lent input))
    (sole-so %noun (welp left [current [right]]))
  ?+  `@`(snag ip input)
    $(ip +(ip))
    $'+'  $(ip +(ip), current +(current))
    $'-'  $(ip +(ip), current (dec current))
    $'>'  %=  $
      ip  +(ip)
      left  (welp left ~[current])
      current  (snag 0 right)
      right  (slag 1 right)
      ==
    $'<'  %=  $
      ip  +(ip)
      left  (scag (dec (lent left)) left)
      current  (snag (dec (lent left)) left)
      right  (welp ~[current] right)
      ==
    $'['  ?.  =(current 0)
        $(ip +(ip))
      =+  [nest=0 pos=+(ip)]
      |-
        =+  char=`@`(snag pos input)
      ?:  =(char '[')
        $(nest +(nest), pos +(pos))
      ?:  =(char ']')
        ?:  =(nest 0)
          ^$(ip +(pos))
        $(nest (dec nest), pos +(pos))
      $(pos +(pos))
    $']'  ?:  =(current 0)
        $(ip +(ip))
      =+  [nest=0 pos=(dec ip)]
      |-
        =+  char=`@`(snag pos input)
      ?:  =(char ']')
        $(nest +(nest), pos (dec pos))
      ?:  =(char '[')
        ?:  =(nest 0)
          ^$(ip +(pos))
        $(nest (dec nest), pos (dec pos))
      $(pos (dec pos))
    $'.'  ~&  `@t`current
      $(ip +(ip))
    $','  
      |-
      ?~  in
        %+  sole-lo  [%& %bf-in ""]
        |=(a/tape ^$(in (crip "{a}\0a")))
      %=  ^$
        ip  +(ip)
        current  (cut 3 [0 1] in)
        in  (rsh 3 1 in)
      ==
  ==
--
