(loadsprite 0
......xxx.......
.....xxxxx......
......xxx.......
.....xxxxx......
....xxxxxxx.....
.....xxxxx......
....xxxxxxx.....
...xxxxxxxxx....
....xxxxxxx.....
.....xxxxx......)

(loadsprite 1
.........xxx....
........xxxxx...
.........xxx....
.......xxxxx....
......xxxxxxx...
.......xxxxx....
....xxxxxxx.....
...xxxxxxxxx....
....xxxxxxx.....
.....xxxxx......)

(loadsprite 2
...xxx..........
..xxxxx.........
...xxx..........
...xxxxx........
..xxxxxxx.......
...xxxxx........
....xxxxxxx.....
...xxxxxxxxx....
....xxxxxxx.....
.....xxxxx......)

(loadsprite 3
....xxxxx...
....xxxxx...
.....xxx....
.....xxx....
.....xxx....
.....xxx....
.....xxx....
.....xx.....
.....xx.....
.....xx.....
......x.....
......x.....
......x.....
......x.....
......x.....)

(loadsprite 4
................
................
................
................
................
.....xxxxx......
....xxxxxxx.....
...xxxxxxxxx....
....xxxxxxx.....
.....xxxxx......)

(newvar line 0)

(loop
  (when (> line 22) (break))
  (plot line 29 89)
  (plotcolor line 29 1)
  (put (+ line 1) line))

(put 1 line)

(loop
  (when (equal line 29)
    (break)
  )
  (plot 23 line 160)
  (plotcolor 23 line 1)
  (put (+ line 1) line)
)

(put 1 line)
(newvar line2 1)

(loop
  (when (equal line2 15)
    (break)
  )
  (loop
    (when (equal line 29)
      (break)
    )
    (when (> (random) 200)
      (plot line2 line 46)
      (plotcolor line2 line 15)
    )
    (put (+ line 1) line)
  )
  (put 1 line)
  (put (+ line2 1) line2)
)

(put 0 backgroundcolor)
(put 6 bordercolor)

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

(setsprite 1 3)
(setsprite 2 3)
(setsprite 3 3)
(setsprite 0 0)
(setsprite 4 4)

(put 1 player0color)
(put 1 player4color)
(put 3 player1color)
(put 3 player2color)
(put 3 player3color)

(put 100 player0x)
(put 215 player0y)

(newarray startmessage 83 78 79 87 77 65 78 96 83 76 73 68 69 82 0)
(newvar startcursor 0)

(loop
  (when (equal (index startcursor startmessage) 0) (break))
  (plot 1 (+ startcursor 10) (- (index startcursor startmessage) 64))
  (plotcolor 1 (+ startcursor 10) 1)
  (put (+ startcursor 1) startcursor))

(resetscore)

(loop
  (drawscreen)
  (when (joyfire) (break))
)

(label resetgame)

(mutesound1)
(mutesound2)

(newvar wipe 0)

(loop
  (when (> wipe 14)(break))
  (plot 1 (+ wipe 10) 32)
  (put (+ wipe 1) wipe))

(resetscore)

(put 100 player0x)
(put 215 player0y)

(put 175 player4x)
(put 215 player4y)

(put 50 player1y)
(put 100 player1x)

(put 50 player2y)
(put 150 player2x)

(put 50 player3y)
(put 175 player3x)

(newvar movleft 0)
(newvar movright 0)

(newvar movtime 10)

(newvar slidetime 20)

(routine moveice
  (put (+ player1y 5) player1y)
  (put (+ player2y 8) player2y)
  (put (+ player3y 12) player3y)
  (when (> player1y 215)
    (put 50 player1y)
    (put (random) player1x)
    (when (> player1x 240)
      (put 240 player1x)
    )
    (when (< player1x 50)
      (put 50 player1x)
    )
  )
  (when (> player2y 215)
    (put 50 player2y)
    (put (random) player2x)
    (when (> player2x 240)
      (put 240 player2x)
    )
    (when (< player2x 50)
      (put 50 player2x)
    )
  )
  (when (> player3y 215)
    (put 50 player3y)
    (put (random) player3x)
    (when (> player3x 240)
      (put 240 player3x)
    )
    (when (< player3x 50)
      (put 50 player3x)
    )
  )
)

(newvar falltime 30)
(newvar fallreset 30)
(newvar speedtime 200)

(newvar soundtime 0)

(loop
  (when (> soundtime 0)
    (put (- soundtime 1) soundtime)
  )
  (when (equal soundtime 0)
    (mutesound2)
  )
  (when (> speedtime 0)
    (put (- speedtime 1) speedtime)
  )
  (when (equal speedtime 0)
    (when (> fallreset 5)
      (put (- fallreset 1) fallreset)
    )
    (put 200 speedtime)
  )

  (when (> falltime 0)
    (put (- falltime 1) falltime)
  )
  (when (equal falltime 0)
    (execute moveice)
    (put fallreset falltime)
  )

  (when (> player0x 240)
    (put 10 player0x)
  )

  (when (< player0x 10)
    (put 240 player0x)
  )

  (when (> slidetime 0)
    (put (- slidetime 1) slidetime)
  )
  (when (equal slidetime 0)
    (when (> movleft 0)
      (put (- movleft 1) movleft)
    )
    (when (> movright 0)
      (put (- movright 1) movright)
    )
    (put 20 slidetime)
  )

  (when (> movright 10)
    (put 10 movright)
  )

  (when (> movleft 10)
    (put 10 movleft)
  )

  (put (+ player0x movright) player0x)
  (put (- player0x movleft) player0x)

  (setsprite 0 0)
  (when (joyleft)
    (when (> movtime 0)
      (put (- movtime 1) movtime)
    )
    (when (equal movtime 0)
      (put (+ movleft 1) movleft)
      (put 10 movtime)
    )
    (setsprite 0 2)
  )
  (when (joyright)
    (when (> movtime 0)
      (put (- movtime 1) movtime)
    )
    (when (equal movtime 0)
      (put (+ movright 1) movright)
      (put 10 movtime)
    )
    (setsprite 0 1)
  )

  (hitboxes 5 25 5 25)
  (when (collision 0 1)
    (goto gameover)
  )
  (hitboxes 5 25 5 25)
  (when (collision 0 2)
    (goto gameover)
  )
  (hitboxes 5 25 5 25)
  (when (collision 0 3)
    (goto gameover)
  )

  (hitboxes 10 25 10 25)
  (when (collision 0 4)
    (playsound2)
    (put 5 soundtime)
    (addpoints 25)
    (put (random) player4x)
    (when (> player4x 240)
      (put 240 player4x)
    )
    (when (< player4x 50)
      (put 50 player4x)
    )
  )

  (drawscreen)
)

(label gameover)

(mutesound2)
(playsound1)

(setsprite 0 0)

(newvar cursor 0)
(newarray message 71 65 77 69 96 79 86 69 82 0)
(newvar crashtime 15)

(loop
  (when (equal (index cursor message) 0) (break))
  (plot 1 (+ cursor 10) (- (index cursor message) 64))
  (plotcolor 1 (+ cursor 10) 1)
  (put (+ cursor 1) cursor))

(loop
  (when (> crashtime 0)
    (put (- crashtime 1) crashtime)
  )
  (when (equal crashtime 0)
    (mutesound1)
  )
  (drawscreen)
  (when (joyfire)
    (goto resetgame)
  )
)
