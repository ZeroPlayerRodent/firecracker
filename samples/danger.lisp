(loadsprite 0
.xx...xx.
x.......x
x.......x
....x....
...xxx...
....x....
x.......x
x.......x
.xx...xx.
)

(loadsprite 1
xxxxx
)

(loadsprite 2
..x..
.xxx.
..x..
.xxx.
x.x.x
..x..
.x.x.
.x.x.
)

(loadsprite 3
..x..
.xxx.
..x..
xxxxx
..x..
..x..
.x.x.
x...x
)

(plotcolor 1 31 1)
(plotcolor 1 32 1)
(plotcolor 1 33 1)
(plotcolor 1 34 1)
(plotcolor 1 35 1)
(plotcolor 1 36 1)

(plotcolor 2 31 0)
(plotcolor 2 32 0)
(plotcolor 2 33 0)
(plotcolor 2 34 0)
(plotcolor 2 35 0)
(plotcolor 2 36 0)

(newvar line 1)
(loop
  (when (equal line 23)(break))
  (plot line 27 89)
  (plotcolor line 27 1)
  (put (+ line 1) line)
)

(setsprite 5 0)
(setsprite 0 1)
(setsprite 1 2)

(put 6 player0color)
(put 5 player5color)
(put 4 player1color)

(put 0 backgroundcolor)

(newvar wipex 0)
(newvar wipey 0)
(routine wipe
  (put 1 wipex)
  (put 1 wipey)
  (loop
    (when (equal wipey 25)(break))
    (loop
      (when (equal wipex 27)(break))
      (plot wipey wipex 96)
      (plotcolor wipey wipex 2)
      (put (+ wipex 1) wipex)
    )
    (put 1 wipex)
    (put (+ wipey 1) wipey)
  )
)

(newvar div 0)
(newvar og 0)
(newvar result 0)
(routine divide
  (put 0 result)
  (put div og)
  (loop
    (when (> div og)(break))
    (put (+ result 1) result)
    (put (- div 8) div)
  )
)


(newvar walk 0)
(routine moveplayer
  (when (joyup)
    (put (- player0y 1) player0y)
    (put (+ walk 1) walk)
  )
  (when (joydown)
    (put (+ player0y 1) player0y)
    (put (+ walk 1) walk)
  )
  (when (joyleft)
    (put (- player0x 1) player0x)
    (put (+ walk 1) walk)
  )
  (when (joyright)
    (put (+ player0x 1) player0x)
    (put (+ walk 1) walk)
  )
  (when (> walk 8)
    (put 0 walk)
  )
  (when (< walk 4)
    (setsprite 1 2)
  )
  (when (> walk 4)
    (setsprite 1 3)
  )

  (when (> player0x 225)
    (put 225 player0x)
  )
  (when (< player0x 50)
    (put 50 player0x)
  )
  (when (> player0y 240)
    (put 240 player0y)
  )
  (when (< player0y 75)
    (put 75 player0y)
  )
  (put player0x player1x)
  (put (- player0y 16) player1y)
)

(routine aim
  (put (random) player5x)
  (when (> player5x 225)
    (put 225 player5x)
  )
  (when (< player5x 50)
    (put 50 player5x)
  )
  (put (random) player5y)
  (when (> player5y 225)
    (put 225 player5y)
  )
  (when (< player5y 75)
    (put 75 player5y)
  )
)

(newarray startmessage 68 65 78 71 69 82 96 82 79 79 77 0)
(newvar startcursor 0)

(loop
  (when (equal (index startcursor startmessage) 0)
    (break)
  )
  (plot 2 (+ startcursor 4) (- (index startcursor startmessage) 64))
  (plotcolor 2 (+ startcursor 4) 1)
  (put (+ startcursor 1) startcursor)
)

(resetscore)
(resetscore2)
(put 6 bordercolor)

(loop
  (when (joyfire)
    (goto resetgame)
  )
  (drawscreen)
)

(label resetgame)

(mutesound1)
(mutesound2)

(put 6 bordercolor)

(resetscore)
(resetscore2)

(put 125 player0x)
(put 125 player0y)

(put player0x player1x)
(put (- player0y 16) player1y)

(put 0 player5x)
(put 0 player5y)

(execute wipe)

(execute aim)

(newvar didhit 0)
(put bgcollision didhit)

(newvar plotx 0)
(newvar ploty 0)
(newvar wait 60)
(newvar sfx 0)
(loop
  (when (> sfx 0)
    (put (- sfx 1) sfx)
  )
  (when (equal sfx 0)
    (mutesound2)
  )

  (when (> wait 0)
    (put (- wait 1) wait)
  )
  
  (when (equal wait 0)
    (put (- player5x 40) div)
    (execute divide)
    (put (+ result 1) plotx)

    (put (- player5y 60) div)
    (execute divide)
    (put (+ result 1) ploty)

    (plot ploty plotx 86)
    (plot ploty (+ plotx 1) 86)
    (plot (+ ploty 1) plotx 86)
    (plot (+ ploty 1) (+ plotx 1) 86)

    (addpoints 5)

    (execute aim)
    (when (> (random) 200)
      (put player1x player5x)
      (put (+ player1y 8) player5y)
    )
    (put 60 wait)
    (put 15 sfx)
    (playsound2)
  )
  (execute moveplayer)
  (put bgcollision didhit)
  (when (equal (and didhit 1) 1)
    (goto gameover)
  )
  (drawscreen)
)

(label gameover)

(put 2 bordercolor)

(newvar boom 35)

(mutesound2)
(playsound1)

(loop
  (when (> boom 0)
    (put (- boom 1) boom)
  )
  (when (equal boom 0)
    (mutesound1)
  )
  (when (joyfire)
    (goto resetgame)
  )
  (drawscreen)
)
