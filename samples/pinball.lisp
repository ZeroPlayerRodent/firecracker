(loadsprite 0
.........xxx.
........xxxxx
.........xxx.
)

(loadsprite 1
......................xx
...................xxxxx
................xxxx....
.............xxxx.......
..........xxxx..........
.......xxxx.............
)

(loadsprite 2
.....xxxxxxxxxxxxxxxxxxx
)

(loadsprite 3
xx......................
xxxxx...................
....xxxx................
.......xxxx.............
..........xxxx..........
.............xxxx.......
)

(loadsprite 4
xxxxxxxxxxxxxxxxxxx.....
)

(loadsprite 5
..xxxxxxxx..
.xxxxxxxxxx.
xxx......xxx
xx........xx
xx........xx
xxx......xxx
.xxxxxxxxxx.
..xxxxxxxx..
)

(put 0 backgroundcolor)
(put 12 bordercolor)

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
  (plot line 28 89)
  (plotcolor line 28 1)
  (put (+ line 1) line)
)

(put 1 line)

(loop
  (when (equal line 23)(break))
  (plot line 14 89)
  (plotcolor line 14 1)
  (put (+ line 1) line)
)

(newarray startmessage 80 73 78 66 65 76 76 0)
(newvar startcursor 0)

(loop
  (when (equal (index startcursor startmessage) 0)
    (break)
  )
  (plot 4 (+ startcursor 4) (- (index startcursor startmessage) 64))
  (plotcolor 4 (+ startcursor 4) 1)
  (put (+ startcursor 1) startcursor)
)

(put 230 player1y)
(put 230 player2y)

(put 150 player2x)
(put 200 player1x)

(put 7 player1color)
(put 7 player2color)

(put 14 player0color)
(put 5 player3color)
(put 5 player4color)
(put 5 player5color)

(put 185 player3x)
(put 135 player3y)

(put 150 player4x)
(put 95 player4y)

(put 220 player5x)
(put 95 player5y)

(setsprite 0 0)
(setsprite 1 1)
(setsprite 2 3)
(setsprite 3 5)
(setsprite 4 5)
(setsprite 5 5)

(resetscore)

(loop
  (drawscreen)
  (when (joyfire)
    (goto resetgame)
  )
)

(label resetgame)

(resetscore)

(newvar balls 4)

(plot 3 31 (+ 48 balls))
(plotcolor 3 31 1)

(label newball)

(setsprite 0 0)
(setsprite 1 1)
(setsprite 2 3)
(setsprite 3 5)
(setsprite 4 5)
(setsprite 5 5)

(put 50 player0y)
(put 175 player0x)

(newvar balldown 0)
(newvar ballup 0)

(newvar ballright 0)
(newvar ballleft 0)

(newvar gravtime 10)
(newvar gravreset 10)

(newvar ballrolling 0)

(newvar leftflip 0)
(newvar rightflip 0)

(newvar leftbounce 0)
(newvar rightbounce 0)

(newvar bingtime 0)

(newvar special 2)

(loop

  (when (> ballleft 1)
    (put 1 ballleft)
  )
  (when (> ballright 1)
    (put 1 ballright)
  )

  (put 5 player3color)
  (put 5 player4color)
  (put 5 player5color)

  (when (equal special 1)
    (put 2 player3color)
  )

  (when (equal special 2)
    (put 2 player4color)
  )

  (when (equal special 3)
    (put 2 player5color)
  )

  (when (> bingtime 0)
    (put (- bingtime 1) bingtime)
  )
  (when (equal bingtime 0)
    (mutesound2)
  )

  (when (< player0y 40)
    (goto gameover)
  )

  (when (> leftflip 0)
    (put (- leftflip 1) leftflip)
  )
  (when (> rightflip 0)
    (put (- rightflip 1) rightflip)
  )

  (when (> gravtime 0)
    (put (- gravtime 1) gravtime)
  )


  (when (equal ballrolling 0)
    (when (equal gravtime 0)
      (when (< balldown 10)
        (put (+ balldown 1) balldown)
      )
      (when (> ballup 0)
        (put (- ballup 1) ballup)
      )
      (put gravreset gravtime)
    )
    (put (+ player0y balldown) player0y)
    (put (- player0y ballup) player0y)
    (put (+ player0x ballright) player0x)
    (put (- player0x ballleft) player0x)
  )

  (setsprite 1 1)
  (setsprite 2 3)
  (when (joyright)
    (setsprite 1 2)
    (when (equal 0 rightbounce)
      (put 30 rightflip)
      (put 1 rightbounce)
    )
    (goto skipright)
  )
  (put 0 rightbounce)
  (put 0 rightflip)
  (label skipright)

  (when (joyleft)
    (setsprite 2 4)
    (when (equal 0 leftbounce)
      (put 30 leftflip)
      (put 1 leftbounce)
    )
    (goto skipleft)
  )
  (put 0 leftflip)
  (put 0 leftbounce)
  (label skipleft)

  (when (equal ballrolling 1)
    (put (+ player0y 1) player0y)
    (put (+ player0x 2) player0x)
    (put 1 ballright)
    (when (equal leftflip 0)
      (put 0 ballright)
    )
    (put 0 ballleft)
    (when (joyleft)
      (put (- player0y 1) player0y)
    )
  )

  (when (equal ballrolling 2)
    (put (+ player0y 1) player0y)
    (put (- player0x 2) player0x)
    (put 1 ballleft)
    (when (equal rightflip 0)
      (put 0 ballleft)
    )
    (put 0 ballright)
    (when (joyright)
      (put (- player0y 1) player0y)
    )
  )

  (when (> player0x 225)
    (put ballright ballleft)
    (put 0 ballright)
  )
  (when (< player0x 125)
    (put ballleft ballright)
    (put 0 ballleft)
  )

  (when (< player0y 50)
    (put 0 ballup)
  )

  (put 0 ballrolling)
  (when (> player0x (- player2x 30))
    (when (< player0x (+ player2x 20))
      (when (> player0y (- player2y 5))
        (when (< player0y (+ player2y 20))
          (put 0 balldown)
          (when (> leftflip 0)
            (when (> ballrolling 0)
              (put 1 ballright)
              (put 0 ballleft)
            )
            (put 0 ballrolling)
            (put 8 ballup)
            (put (- player0y 10) player0y)
            (goto skiproll1)
          )
          (put 1 ballrolling)
          (label skiproll1)
        )
      )
    )
  )

  (when (> player0x (- player1x 18))
    (when (< player0x (+ player1x 30))
      (when (> player0y (- player1y 5))
        (when (< player0y (+ player1y 20))
          (put 0 balldown)
          (when (> rightflip 0)
            (when (> ballrolling 0)
              (put 1 ballleft)
              (put 0 ballright)
            )
            (put 0 ballrolling)
            (put 8 ballup)
            (put (- player0y 10) player0y)
            (goto skiproll2)
          )
          (put 2 ballrolling)
          (label skiproll2)
        )
      )
    )
  )

  (hitboxes 20 5 5 15)
  (when (collision 0 3)
    (addpoints 25)
    (when (equal special 1)
      (addpoints 75)
      (put (+ special 1) special)
      (when (> special 3)
        (put 1 special)
      )
    )
    (put 3 bingtime)
    (playsound2)
    (when (< player0y player3y)
      (put 0 balldown)
      (put (+ (and (random) 5) 1) ballup)
    )
    (when (> player0y player3y)
      (put 2 balldown)
      (put 0 ballup)
    )
    (when (> (+ player0x 10) player3x)
      (put 0 ballleft)
      (put (and (random) 3) ballright)
    )
    (when (equal (+ player0x 10) player3x)
      (put 0 ballleft)
      (put (and (random) 3) ballright)
    )
    (when (< (+ player0x 10) player3x)
      (put (and (random) 3) ballleft)
      (put 0 ballright)
    )
  )

  (hitboxes 20 5 5 15)
  (when (collision 0 4)
    (addpoints 25)
    (when (equal special 2)
      (addpoints 75)
      (put (+ special 1) special)
      (when (> special 3)
        (put 1 special)
      )
    )
    (put 3 bingtime)
    (playsound2)
    (when (< player0y player4y)
      (put 0 balldown)
      (put (+ (and (random) 5) 1) ballup)
    )
    (when (> player0y player4y)
      (put 2 balldown)
      (put 0 ballup)
    )
    (when (> player0x player4x)
      (put 0 ballleft)
      (put (and (random) 3) ballright)
    )
    (when (equal player0x player4x)
      (put 0 ballleft)
      (put (and (random) 3) ballright)
    )
    (when (< (+ player0x 10) player4x)
      (put (and (random) 3) ballleft)
      (put 0 ballright)
    )
  )

  (hitboxes 20 5 5 15)
  (when (collision 0 5)
    (addpoints 25)
    (when (equal special 3)
      (addpoints 75)
      (put (+ special 1) special)
      (when (> special 3)
        (put 1 special)
      )
    )
    (put 3 bingtime)
    (playsound2)
    (when (< player0y player5y)
      (put 0 balldown)
      (put (+ (and (random) 5) 1) ballup)
    )
    (when (> player0y player5y)
      (put 2 balldown)
      (put 0 ballup)
    )
    (when (> player0x player5x)
      (put 0 ballleft)
      (put (and (random) 3) ballright)
    )
    (when (equal player0x player5x)
      (put 0 ballleft)
      (put (and (random) 3) ballright)
    )
    (when (< (+ player0x 10) player5x)
      (put (and (random) 3) ballleft)
      (put 0 ballright)
    )
  )
  (drawscreen)
)

(label gameover)

(mutesound2)

(newvar boomtime 10)
(playsound1)

(when (> balls 0)
  (put (- balls 1) balls)
)

(plot 3 31 (+ 48 balls))

(loop
  (drawscreen)
  (when (> boomtime 0)
    (put (- boomtime 1) boomtime)
  )
  (when (equal boomtime 0)
    (mutesound1)
  )
  (when (joyfire)
    (when (equal boomtime 0)
      (when (> balls 0)
        (goto newball)
      )
      (goto resetgame)
    )
  )
)
