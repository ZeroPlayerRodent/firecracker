(loadsprite 0
......x.........
.....x.x......x.
........xxxx..xx
........x.....xx
xxxxx...xxxx..xx
xxxxxxxxxxxx..xx
xxxxx.xxxxxxx.xx
xxxxx.xxxxx.xxxx
.xxx..xxxx...xxx
.....xxxxxx....x
.....xxx.xxx....
......xx..xx....
.....xx..xx.....
.....xxx.xxx....
....xxxxx.xxxx..
)

(loadsprite 1
......x.................
.....x.x...............x
........xxxx..........xx
xxxxx...x............xx.
xxxxx...xxxx........xx..
xxxxxxxxxxxxxxx....xx...
xxxxx.xxxxxx.xxx..xx....
.xxx..xxxxx...xxxxx.....
......xxxx.......xx.....
.....xxxxxx.....x.......
.....xxx.xxx............
......xx..xx............
.....xx....xx...........
...xxx......xxx.........
..xxxxx.....xxxxx.......
)

(loadsprite 2
.................x......
.........x......x.x.....
........xx..xxxx........
........xx.....x........
........xx..xxxx...xxxxx
........xx..xxxxxxxxxxxx
........xx.xxxxxxx.xxxxx
........xxxx.xxxxx.xxxxx
........xxx...xxxx..xxx.
........x....xxxxxx.....
............xxx.xxx.....
............xx..xx......
.............xx..xx.....
............xxx.xxx.....
..........xxxx.xxxxx....
)

(loadsprite 3
.................x......
x...............x.x.....
xx..........xxxx........
.xx............x...xxxxx
..xx........xxxx...xxxxx
...xx....xxxxxxxxxxxxxxx
....xx..xxx.xxxxxx.xxxxx
.....xxxxx...xxxxx..xxx.
.....xx.......xxxx......
.......x.....xxxxxx.....
............xxx.xxx.....
............xx..xx......
...........xx....xx.....
.........xxx......xxx...
.......xxxxx.....xxxxx..
)

(loadsprite 4
..xx....xx......
...xx...x.....x.
....x..xx.x.xx..
..xxxxxxxxxx....
....xxxxxxxxx...
.xxxxxxxxxxxxxxx
...xxxxxxxxxx...
....x.xxx.xx....
...xx..xx...xx..
...x...x.....xx.
)

(loadsprite 5
......x.........
.....x.x......x.
........xxxx..xx
........x.....xx
xxxxx...xxxx..xx
xxxxxxxxxxxx..xx
xxxxx.xxxxxxx.xx
xxxxx.xxxxx.xxxx
.xxx..xxxx...xxx
.....xxxxxx....x
.....xxx..xxx....
......xx....xx...
.....xx....xx....
...xxx.....xxx...
..xxxxx....xxxxx.
)

(loadsprite 6
.................x......
.........x......x.x.....
........xx..xxxx........
........xx.....x........
........xx..xxxx...xxxxx
........xx..xxxxxxxxxxxx
........xx.xxxxxxx.xxxxx
........xxxx.xxxxx.xxxxx
........xxx...xxxx..xxx.
........x....xxxxxx.....
...........xxx..xxx.....
..........xx....xx......
...........xx....xx.....
..........xxx.....xxx...
........xxxxx....xxxxx..
)

(loadsprite 7
...xx................x.x
..x.................x.x.
xxxxxxxxxxxxxxxxxxxxxxxx
..x.................x.x.
...xx................x.x
)

(loadsprite 8
x.x................xx...
.x.x.................x..
xxxxxxxxxxxxxxxxxxxxxxxx
.x.x.................x..
x.x................xx...
)

(loadsprite 9
........x.x.x
.........xxx.
........x.x.x
.........xxx.
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
........x.x.x
........x.x.x
.........xxx.
..........x..
)

(loadsprite 10
..........x..
.........xxx.
........x.x.x
........x.x.x
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
..........x..
.........xxx.
........x.x.x
.........xxx.
........x.x.x
)

(loadsprite 11
................
................
.....x..........
....x.x.........
.......xxxx.....
.......x........
xxxxx..xxxx..x..
xxxxxxxxxxxx..x.
xxxxx.xxxxxxx.x.
xxxxx.xxxxx.xxx.
.xxx..xxxx...x..
.....xxxxxx.....
.....xxx.xxx....
..xx..xx..xx....
..xxxxx.xxx.....
)

(loadsprite 12
................
................
................
................
................
......x.........
.....x.x........
........xxxx....
.......xxxx....
.x..x.xxxxxxx...
..xxx.xxxxx.xxx.
.....xxxxxx.....
.....xxx.xxx....
..xx..xx..xx....
..xxxxx.xxx.....
)

(loadsprite 13
................
................
................
................
................
................
................
................
................
.......x........
......x.x.......
.........xxxxxx.
....xxxxxxxxxxx.
..xxxxxx.xxxx..x
.xxxxxx.xxxxxx.x
)

(put 0 backgroundcolor)
(put 12 bordercolor)

(newvar line 1)
(loop
  (when (equal line 23)
    (break)
  )
  (plot line 30 89)
  (plotcolor line 30 1)
  (put (+ line 1) line)
)

(newvar bgx 1)
(newvar bgy 1)
(loop
  (when (equal bgy 23)(break))
  (loop
    (when (equal bgx 29)(break))
    (when (> (random) 220)
      (plot bgy bgx 104)
      (plotcolor bgy bgx 9)
      (when (> (random) 125)
        (plotcolor bgy bgx 5)
      )
    )
    (put (+ bgx 1) bgx)
  )
  (put 1 bgx)
  (put (+ bgy 1) bgy)
)

(newarray startmessage 75 78 73 71 72 84 83 96 65 84 84 65 67 75 0)
(newvar startcursor 0)

(loop
  (when (equal (index startcursor startmessage) 0) (break))
  (plot 1 (+ startcursor 8) (- (index startcursor startmessage) 64))
  (plotcolor 1 (+ startcursor 8) 1)
  (put (+ startcursor 1) startcursor))

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

(resetscore)

(loop
  (drawscreen)
  (when (joyfire)
    (goto resetgame)
  )
)

(label resetgame)

(resetscore)

(setsprite 0 0)

(setsprite 7 4)

(put 7 player7color)
(put 0 player7x)
(put 0 player7y)

(put 14 player0color)

(put 150 player0y)
(put 100 player0x)

(newvar p1dir 0)
(newvar p1spd 2)
(newvar p1atk 0)
(newvar p1bounce 0)
(newvar p1cool 0)

(newvar steptime 10)
(newvar step 0)

(routine moveplayer
  (when (> p1cool 0)
    (put (- p1cool 1) p1cool)
  )

  (when (> p1atk 0)
    (put (- p1atk 1) p1atk)
  )

  (when (joyup)
    (put (- player0y p1spd) player0y)
    (when (> steptime 0)
      (put (- steptime 1) steptime)
    )
  )
  (when (joydown)
    (put (+ player0y p1spd) player0y)
    (when (> steptime 0)
      (put (- steptime 1) steptime)
    )
  )

  (when (joyleft)
    (put (- player0x p1spd) player0x)
    (when (> steptime 0)
      (put (- steptime 1) steptime)
    )
    (put 1 p1dir)
  )
  (when (joyright)
    (put (+ player0x p1spd) player0x)
    (when (> steptime 0)
      (put (- steptime 1) steptime)
    )
    (put 0 p1dir)
  )

  (when (> player0x 230)
    (put 230 player0x)
  )
  (when (< player0x 10)
    (put 10 player0x)
  )

  (when (> player0y 220)
    (put 220 player0y)
  )
  (when (< player0y 50)
    (put 50 player0y)
  )

  (when (equal steptime 0)
    (put (+ step 1) step)
    (when (> step 1)
      (put 0 step)
    )
    (put 10 steptime)
  )

  (when (equal p1dir 0)
    (setsprite 0 0)
    (when (equal step 1)
      (setsprite 0 5)
    )
  )
  (when (equal p1dir 1)
    (setsprite 0 2)
    (when (equal step 1)
      (setsprite 0 6)
    )
  )
  (when (joyfire)
    (when (equal p1cool 0)
      (when (equal p1atk 0)
        (when (equal p1bounce 0)
          (playsound2)
          (put 25 p1atk)
          (put 40 p1cool)
          (put 1 p1bounce)
        )
      )
    )
    (goto p1dontbounce)
  )
  (put 0 p1bounce)
  (label p1dontbounce)

  (when (> p1atk 0)
    (put 1 p1spd)
    (when (equal p1dir 0)
      (setsprite 0 1)
    )
    (when (equal p1dir 1)
      (setsprite 0 3)
    )
  )
  (when (equal p1atk 0)
    (put 2 p1spd)
    (mutesound2)
  )
)

(newarray leftx 0 0)
(newarray lefty 50 125)
(newarray leftatk 0 0)
(newarray leftstep 0 1)
(setsprite 1 0)
(setsprite 2 0)

(put 15 player1color)
(put 15 player2color)

(routine movelefts

  (put (+ (index 0 leftstep) 1) (index 0 leftstep))
  (when (> (index 0 leftstep) 1)
    (put 0 (index 0 leftstep))
  )

  (put (+ (index 1 leftstep) 1) (index 1 leftstep))
  (when (> (index 1 leftstep) 1)
    (put 0 (index 1 leftstep))
  )

  (when (equal (index 0 leftatk) 2)
    (put 0 (index 0 leftatk))
  )
  (setsprite 1 0)
  (when (equal (index 0 leftstep) 1)
    (setsprite 1 5)
  )
  (when (equal (index 1 leftatk) 2)
    (put 0 (index 1 leftatk))
  )
  (setsprite 2 0)
  (when (equal (index 1 leftstep) 1)
    (setsprite 2 5)
  )
  (when (equal (index 0 leftatk) 1)
    (setsprite 1 1)
    (put 2 (index 0 leftatk))
    (put 15 player1color)
  )
  (when (equal (index 1 leftatk) 1)
    (setsprite 2 1)
    (put 2 (index 1 leftatk))
    (put 15 player2color)
  )
  (when (> (random) 200)
    (when (equal (index 0 leftatk) 0)
      (put 1 (index 0 leftatk))
      (put 2 player1color)
    )
  )
  (when (> (random) 220)
    (when (equal (index 1 leftatk) 0)
      (put 1 (index 1 leftatk))
      (put 2 player2color)
    )
  )
  (put (+ (index 0 leftx) 5) (index 0 leftx))
  (put (+ (index 1 leftx) 4) (index 1 leftx))
  (when (> (index 0 leftx) 220)
    (put 0 (index 0 leftx))
  )
  (when (> (index 1 leftx) 220)
    (put 0 (index 1 leftx))
  )
)

(newarray rightx 230 230)
(newarray righty 75 175)
(newarray rightatk 0 0)
(newarray rightstep 1 0)
(setsprite 3 2)
(setsprite 4 2)

(put 15 player3color)
(put 15 player4color)

(routine moverights
  (put (+ (index 0 rightstep) 1) (index 0 rightstep))
  (when (> (index 0 rightstep) 1)
    (put 0 (index 0 rightstep))
  )

  (put (+ (index 1 rightstep) 1) (index 1 rightstep))
  (when (> (index 1 rightstep) 1)
    (put 0 (index 1 rightstep))
  )

  (when (equal (index 0 rightatk) 2)
    (put 0 (index 0 rightatk))
  )
  (setsprite 3 2)
  (when (equal (index 0 rightstep) 1)
    (setsprite 3 6)
  )
  (when (equal (index 1 rightatk) 2)
    (put 0 (index 1 rightatk))
  )
  (setsprite 4 2)
  (when (equal (index 1 rightstep) 1)
    (setsprite 4 6)
  )
  (when (equal (index 0 rightatk) 1)
    (setsprite 3 3)
    (put 2 (index 0 rightatk))
    (put 15 player3color)
  )
  (when (equal (index 1 rightatk) 1)
    (setsprite 4 3)
    (put 2 (index 1 rightatk))
    (put 15 player4color)
  )
  (when (> (random) 200)
    (when (equal (index 0 rightatk) 0)
      (put 1 (index 0 rightatk))
      (put 2 player3color)
    )
  )
  (when (> (random) 220)
    (when (equal (index 1 rightatk) 0)
      (put 1 (index 1 rightatk))
      (put 2 player4color)
    )
  )
  (put (- (index 0 rightx) 4) (index 0 rightx))
  (put (- (index 1 rightx) 5) (index 1 rightx))
  (when (< (index 0 rightx) 10)
    (put 230 (index 0 rightx))
  )
  (when (< (index 1 rightx) 10)
    (put 230 (index 1 rightx))
  )
)

(newvar movetime 25)
(newvar movereset 25)

(newvar soundtime 0)

(newvar bonus 25)

(newvar arrowtime 255)
(newvar arrowmove 0)

(newvar arrowtime2 255)
(newvar arrowmove2 0)

(put 12 player6color)
(put 12 player5color)

(setsprite 6 7)
(setsprite 5 9)

(put 0 player6x)
(put 0 player6y)
(put 0 player5x)
(put 0 player5y)

(loop

  (when (> arrowtime 0)
    (put (- arrowtime 1) arrowtime)
  )

  (when (equal arrowtime 0)
    (when (equal arrowmove 0)
      (when (> player0x 125)
        (put player0y player6y)
        (put 1 arrowmove)
        (put 10 player6x)
        (setsprite 6 8)
      )
      (when (< player0x 125)
        (put player0y player6y)
        (put 2 arrowmove)
        (put 240 player6x)
        (setsprite 6 7)
      )
    )
  )

  (when (equal arrowmove 1)
    (put (+ player6x 2) player6x)
  )

  (when (equal arrowmove 2)
    (put (- player6x 2) player6x)
  )

  (when (> player6x 240)
    (put 0 arrowmove)
    (put (random) arrowtime)
    (put 50 player6x)
    (put 0 player6y)
  )

  (when (< player6x 10)
    (put 0 arrowmove)
    (put (random) arrowtime)
    (put 50 player6x)
    (put 0 player6y)
  )

  (when (> arrowtime2 0)
    (put (- arrowtime2 1) arrowtime2)
  )

  (when (equal arrowtime2 0)
    (when (equal arrowmove2 0)
      (when (> player0y 125)
        (put player0x player5x)
        (put 1 arrowmove2)
        (put 10 player5y)
        (setsprite 5 9)
      )
      (when (< player0y 125)
        (put player0x player5x)
        (put 2 arrowmove2)
        (put 240 player5y)
        (setsprite 5 10)
      )
    )
  )

  (when (equal arrowmove2 1)
    (put (+ player5y 2) player5y)
  )

  (when (equal arrowmove2 2)
    (put (- player5y 2) player5y)
  )

  (when (> player5y 240)
    (put 0 arrowmove2)
    (put (random) arrowtime2)
    (put 0 player5x)
    (put 0 player5y)
  )

  (when (< player5y 10)
    (put 0 arrowmove2)
    (put (random) arrowtime2)
    (put 0 player5x)
    (put 0 player5y)
  )

  (when (> bonus 25)
    (put (- bonus 1) bonus)
  )

  (when (> movetime 0)
    (put (- movetime 1) movetime)
  )
  (when (equal movetime 0)
    (execute movelefts)
    (execute moverights)
    (put movereset movetime)
  )

  (when (> soundtime 0)
    (put (- soundtime 1) soundtime)
  )
  (when (equal soundtime 0)
    (put 0 player7x)
    (put 0 player7y)
    (mutesound1)
  )

  (put (index 0 leftx) player1x)
  (put (index 1 leftx) player2x)
  (put (index 0 lefty) player1y)
  (put (index 1 lefty) player2y)

  (put (index 0 rightx) player3x)
  (put (index 1 rightx) player4x)
  (put (index 0 righty) player3y)
  (put (index 1 righty) player4y)

  (execute moveplayer)

  (hitboxes 20 15 20 15)
  (when (collision 0 1)
    (when (> p1atk 0)
      (when (> (random) 175)
        (when (> movereset 6)
          (put (- movereset 1) movereset)
        )
      )
      (put 0 p1cool)
      (addpoints bonus)
      (put 100 bonus)
      (when (equal soundtime 0)
        (put (index 0 leftx) player7x)
        (put (index 0 lefty) player7y)
        (put 15 soundtime)
        (playsound1)
      )
      (put 0 (index 0 leftx))
      (put (random) (index 0 lefty))
      (when (> (index 0 lefty) 220)
        (put 220 (index 0 lefty))
      )
      (when (< (index 0 lefty) 50)
        (put 50 (index 0 lefty))
      )
    )
    (when (equal (index 0 leftatk) 2)
      (goto p1dead)
    )
  )

  (hitboxes 20 15 20 15)
  (when (collision 0 2)
    (when (> p1atk 0)
      (when (> (random) 175)
        (when (> movereset 6)
          (put (- movereset 1) movereset)
        )
      )
      (put 0 p1cool)
      (addpoints bonus)
      (put 100 bonus)
      (when (equal soundtime 0)
        (put (index 1 leftx) player7x)
        (put (index 1 lefty) player7y)
        (put 15 soundtime)
        (playsound1)
      )
      (put 0 (index 1 leftx))
      (put (random) (index 1 lefty))
      (when (> (index 1 lefty) 220)
        (put 220 (index 1 lefty))
      )
      (when (< (index 1 lefty) 50)
        (put 50 (index 1 lefty))
      )
    )
    (when (equal (index 1 leftatk) 2)
      (goto p1dead)
    )
  )

  (hitboxes 20 15 20 15)
  (when (collision 0 3)
    (when (> p1atk 0)
      (when (> (random) 175)
        (when (> movereset 6)
          (put (- movereset 1) movereset)
        )
      )
      (put 0 p1cool)
      (addpoints bonus)
      (put 100 bonus)
      (when (equal soundtime 0)
        (put (index 0 rightx) player7x)
        (put (index 0 righty) player7y)
        (put 15 soundtime)
        (playsound1)
      )
      (put 230 (index 0 rightx))
      (put (random) (index 0 righty))
      (when (> (index 0 righty) 220)
        (put 220 (index 0 righty))
      )
      (when (< (index 0 righty) 50)
        (put 50 (index 0 righty))
      )
    )
    (when (equal (index 0 rightatk) 2)
      (goto p1dead)
    )
  )

  (hitboxes 20 15 20 15)
  (when (collision 0 4)
    (when (> p1atk 0)
      (when (> (random) 175)
        (when (> movereset 6)
          (put (- movereset 1) movereset)
        )
      )
      (put 0 p1cool)
      (addpoints bonus)
      (put 100 bonus)
      (when (equal soundtime 0)
        (put (index 1 rightx) player7x)
        (put (index 1 righty) player7y)
        (put 15 soundtime)
        (playsound1)
      )
      (put 230 (index 1 rightx))
      (put (random) (index 1 righty))
      (when (> (index 1 righty) 220)
        (put 220 (index 1 righty))
      )
      (when (< (index 1 righty) 50)
        (put 50 (index 1 righty))
      )
    )
    (when (equal (index 1 rightatk) 2)
      (goto p1dead)
    )
  )

  (hitboxes 20 20 30 5)
  (when (collision 0 6)
    (goto p1dead)
  )

  (hitboxes 10 20 5 25)
  (when (collision 0 5)
    (goto p1dead)
  )

  (drawscreen)
)

(label p1dead)

(mutesound1)
(mutesound2)

(setsprite 0 11)

(newvar animframe 0)

(loop
  (drawscreen)
  (when (< animframe 6)
    (put (+ animframe 1) animframe)
  )
  (when (equal animframe 3)
    (setsprite 0 12)
  )
  (when (equal animframe 6)
    (setsprite 0 13)
    (break)
  )
)

(newvar restart 50)

(loop
  (drawscreen)
  (when (joyfire)
    (put (- restart 1) restart)
  )
  (when (equal restart 0)
    (goto resetgame)
  )
)
