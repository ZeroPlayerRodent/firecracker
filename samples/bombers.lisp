(loadsprite 0
.....xx.....
...xxxxx....
.xxxxxxxx...
......x.....
x.....x....x
xxxxxxxxxxx.
.xxxxxxxxx..
...xxxxxx...)

(loadsprite 3
.....xx.....
....xxxxx...
...xxxxxxxx.
.....x......
x....x.....x
.xxxxxxxxxxx
..xxxxxxxxx.
...xxxxxx...)

(loadsprite 1
..x.x..x
..xxxxx.
xxx.xxxx
.x.xxxx.
xxxxxxxx
.xxxxxx.
xxxxxxxx
.xxxxx..
x.x..x..)

(loadsprite 2
........
....x...
...xx...
..xx.x..
.xx.xx..
.xxx.xx.
x.xxxxxx)

(setsprite 0 0)
(setsprite 5 0)
(setsprite 1 1)
(setsprite 2 1)
(setsprite 3 1)
(setsprite 4 2)

(plotcolor 1 31 8)
(plotcolor 1 32 8)
(plotcolor 1 33 8)
(plotcolor 1 34 8)
(plotcolor 1 35 8)
(plotcolor 1 36 8)

(plotcolor 2 31 10)
(plotcolor 2 32 10)
(plotcolor 2 33 10)
(plotcolor 2 34 10)
(plotcolor 2 35 10)
(plotcolor 2 36 10)

(newvar line 0)

(loop
  (when (> line 22) (break))
  (plot line 29 89)
  (plotcolor line 29 1)
  (put (+ line 1) line))

(newvar bgx 1)
(newvar bgy 1)
(loop
  (when (equal bgy 23)(break))
  (loop
    (when (equal bgx 29)(break))
    (when (> (random) 200)
      (plot bgy bgx 104)
      (plotcolor bgy bgx 14)
    )
    (put (+ bgx 1) bgx)
  )
  (put 1 bgx)
  (put (+ bgy 1) bgy)
)

(newarray startmessage 66 79 77 66 69 82 83 96 68 79 68 71 69 0)
(newvar startcursor 0)

(loop
  (when (equal (index startcursor startmessage) 0) (break))
  (plot 1 (+ startcursor 10) (- (index startcursor startmessage) 64))
  (plotcolor 1 (+ startcursor 10) 1)
  (put (+ startcursor 1) startcursor))

(put 11 bordercolor)
(put 6 backgroundcolor)

(put 12 player1color)
(put 12 player2color)
(put 12 player3color)
(put 7 player4color)
(put 8 player0color)
(put 10 player5color)

(resetscore)
(resetscore2)

(loop
  (when (joyfire)(break))
  (drawscreen))

(label reset)

(newvar wipe 0)

(loop
  (when (> wipe 13)(break))
  (plot 1 (+ wipe 10) 32)
  (put (+ wipe 1) wipe))

(resetscore)
(resetscore2)

(put 50 player4x)
(put 50 player4y)

(newvar p1dead 0)
(newvar p2dead 0)

(put 150 player0x)
(put 200 player0y)

(put 150 player5x)
(put 200 player5y)

(newvar s1time 0)
(newvar s2time 0)

(newarray balls 1 0 55 50 0 1 100 80 1 1 150 120)
(newvar scoretime 100)
(newvar movereset 10)
(newvar movetime 10)
(newvar speed 3)

(newvar storage 0)

(newvar pointer 0)
(routine moveball
  (loop
    (when (equal pointer 12) (break))

    (when (equal (index pointer balls) 0)
      (put (+ (index (+ pointer 2) balls) speed) (index (+ pointer 2) balls)))
    (when (equal (index pointer balls) 1)
      (put (- (index (+ pointer 2) balls) speed) (index (+ pointer 2) balls)))

    (put (+ pointer 1) pointer)

    (when (equal (index pointer balls) 0)
      (put (+ (index (+ pointer 2) balls) speed) (index (+ pointer 2) balls)))
    (when (equal (index pointer balls) 1)
      (put (- (index (+ pointer 2) balls) speed) (index (+ pointer 2) balls)))

    (put (+ pointer 1) pointer)
    (when (> (index pointer balls) 240)
      (put 1 (index (- pointer 2) balls)))
    (when (< (index pointer balls) 30)
      (put 0 (index (- pointer 2) balls)))

    (put (+ pointer 1) pointer)
    (when (> (index pointer balls) 230)
      (put 1 (index (- pointer 2) balls)))
    (when (< (index pointer balls) 50)
      (put 0 (index (- pointer 2) balls)))
    (put (+ pointer 1) pointer))
  (put 0 pointer))

(loop

  (when (> s2time 0)
    (put (- s2time 1) s2time))

  (when (equal s2time 0)
    (mutesound2))

  (when (joyup)
    (put (- player0y 2) player0y))
  (when (joydown)
    (put (+ player0y 2) player0y))
  (when (joyright)
    (put (+ player0x 2) player0x)
    (setsprite 0 0))
  (when (joyleft)
    (put (- player0x 2) player0x)
    (setsprite 0 3))

  (when (equal p1dead 0)
    (when (> player0x 240)
      (put 240 player0x))
    (when (< player0x 30)
      (put 30 player0x))
    (when (> player0y 220)
      (put 220 player0y))
    (when (< player0y 50)
      (put 50 player0y)))

  (when (joyup2)
    (put (- player5y 2) player5y))
  (when (joydown2)
    (put (+ player5y 2) player5y))
  (when (joyright2)
    (put (+ player5x 2) player5x)
    (setsprite 5 0))
  (when (joyleft2)
    (put (- player5x 2) player5x)
    (setsprite 5 3))

  (when (equal p2dead 0)
    (when (> player5x 240)
      (put 240 player5x))
    (when (< player5x 30)
      (put 30 player5x))
    (when (> player5y 220)
      (put 220 player5y))
    (when (< player5y 50)
      (put 50 player5y)))

  (when (< 0 movetime)
    (put (- movetime 1) movetime)
    (when (equal 0 movetime)
      (execute moveball)
      (put movereset movetime)))

  (put (index 2 balls) player1x)
  (put (index 3 balls) player1y)

  (put (index 6 balls) player2x)
  (put (index 7 balls) player2y)

  (put (index 10 balls) player3x)
  (put (index 11 balls) player3y)

  (hitboxes 10 10 5 10)
  (when (collision 0 1)
    (put 1 p1dead))

  (hitboxes 10 10 5 10)
  (when (collision 0 2)
    (put 1 p1dead))

  (hitboxes 10 10 5 10)
  (when (collision 0 3)
    (put 1 p1dead))

  (hitboxes 10 10 5 10)
  (when (collision 5 1)
    (put 1 p2dead))

  (hitboxes 10 10 5 10)
  (when (collision 5 2)
    (put 1 p2dead))

  (hitboxes 10 10 5 10)
  (when (collision 5 3)
    (put 1 p2dead))

  (when (equal p1dead 1)
    (put 0 player0x)
    (put 0 player0y))

  (when (equal p2dead 1)
    (put 0 player5x)
    (put 0 player5y))

  (when (equal (+ p1dead p2dead) 2)
    (goto gameover))

  (hitboxes 10 15 8 10)
  (when (collision 0 4)
    (put 5 s2time)
    (playsound2)
    (addpoints 25)
    (put (random) storage)
    (when (> storage 200)
      (put 200 storage))
    (when (< storage 50)
      (put 50 storage))
    (put storage player4x)
    (put (random) storage)
    (when (> storage 200)
      (put 200 storage))
    (when (< storage 50)
      (put 50 storage))
    (put storage player4y))

  (hitboxes 10 15 8 10)
  (when (collision 5 4)
    (put 5 s2time)
    (playsound2)
    (addpoints2 25)
    (put (random) storage)
    (when (> storage 200)
      (put 200 storage))
    (when (< storage 50)
      (put 50 storage))
    (put storage player4x)
    (put (random) storage)
    (when (> storage 200)
      (put 200 storage))
    (when (< storage 50)
      (put 50 storage))
    (put storage player4y))

  (when (< 0 scoretime)
    (put (- scoretime 1) scoretime)
    (when (equal 0 scoretime)
      (put 100 scoretime)
      (when (< 1 movereset)
        (put (- movereset 1) movereset))))

  (drawscreen))

(label gameover)

(mutesound2)

(put 15 s1time)
(playsound1)

(newvar cursor 0)
(newarray message 71 65 77 69 96 79 86 69 82 0)

(loop
  (when (equal (index cursor message) 0) (break))
  (plot 1 (+ cursor 10) (- (index cursor message) 64))
  (plotcolor 1 (+ cursor 10) 1)
  (put (+ cursor 1) cursor))


(loop
  (when (> s1time 0)
    (put (- s1time 1) s1time))
  (when (equal s1time 0)
    (mutesound1))
  (when (joyfire)
    (mutesound1)
    (goto reset))
  (drawscreen))
