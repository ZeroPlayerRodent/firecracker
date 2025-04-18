(defvar var-address #xC00C)
(defvar var-list (list "BORDERCOLOR" #xD020 "BACKGROUNDCOLOR" #xD021))

(defvar xy-hex #xD000)
(defvar hex-dex 0)
(defvar var-dex 0)

(defvar the-location nil)

(defvar temp 0)

(loop
  (when (>= var-dex 8) (return))
  (setf temp (concatenate 'string "PLAYER" (write-to-string var-dex) "X"))
  (setf var-list (concatenate 'list var-list (list temp)))
  (setf var-list (concatenate 'list var-list (list (+ xy-hex hex-dex))))
  (incf hex-dex)
  (setf temp (concatenate 'string "PLAYER" (write-to-string var-dex) "Y"))
  (setf var-list (concatenate 'list var-list (list temp)))
  (setf var-list (concatenate 'list var-list (list (+ xy-hex hex-dex))))
  (setf temp (concatenate 'string "PLAYER" (write-to-string var-dex) "COLOR"))
  (setf var-list (concatenate 'list var-list (list temp)))
  (setf var-list (concatenate 'list var-list (list (+ #xD027 var-dex))))
  (incf hex-dex)
  (incf var-dex)
)

(defvar oldi 0)
(defvar newi 0)
(defvar varname nil)

(defvar didright 0)

(defvar x 0)
(defvar i 0)
(defvar foundfunc nil)

(defvar label-count 0)
(defvar top-loop (list 'l))

(defvar setting nil)

(defvar current-routine "")

(defvar temp1 0)
(defvar temp2 0)
(defvar temp3 0)

(defvar bytes 0)

(defvar subtracting nil)
(defvar the-address nil)

(defun compile-fc (foo start &optional brk)
     
     (setf i start)

     (setf foundfunc nil)
      (when (equal "(" (elt foo i))
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "BGCOLLISION" (elt foo i))
        (setf foundfunc t)
        (let ((bitshit (list 1 2 4 8 16 32 64 128)))
          (incf i)
          (format o " lda #~d~%" (elt bitshit (parse-integer (elt foo i))))
          (format o " bit $D01F~%")
          (format o " bne ")
        )
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "RANDOM" (elt foo i))
        (format o " lda $D41B")
        (incf i)
      )

      (when (equal "AND" (elt foo i))
        (when (not (equal "(" (elt foo (+ i 1))))(format o " lda "))
        (compile-fc code-string (+ i 1))
        (format o " sta $CFFE~%")
        (when (not (equal "(" (elt foo (+ i 1))))(format o " lda "))
        (compile-fc code-string i)
        (format o " and $CFFE~%")
      )

      (when (equal "RESETSCORE" (elt foo i))
        (format o " lda #0~%")
        (format o " sta $C000~%")
        (format o " sta $C001~%")
        (format o " sta $C002~%")
        (format o " sta $C003~%")
        (format o " sta $C004~%")
        (format o " sta $C005~%")
      )

      (when (equal "RESETSCORE2" (elt foo i))
        (format o " lda #0~%")
        (format o " sta $C006~%")
        (format o " sta $C007~%")
        (format o " sta $C008~%")
        (format o " sta $C009~%")
        (format o " sta $C00A~%")
        (format o " sta $C00B~%")
      )

      (when (equal "ADDPOINTS" (elt foo i))
        (format o " ldx ")
        (compile-fc code-string (+ i 1))
        (format o (concatenate 'string "PointLoopNo" (write-to-string label-count) "~%"))
        (format o " jsr AddPoint~%")
        (format o " dex~%")
        (format o " cpx #0~%")
        (format o (concatenate 'string " bne PointLoopNo" (write-to-string label-count) "~%"))
        (incf label-count)
      )

      (when (equal "ADDPOINTS2" (elt foo i))
        (format o " ldx ")
        (compile-fc code-string (+ i 1))
        (format o (concatenate 'string "PointLoopNo" (write-to-string label-count) "~%"))
        (format o " jsr AddPoint2~%")
        (format o " dex~%")
        (format o " cpx #0~%")
        (format o (concatenate 'string " bne PointLoopNo" (write-to-string label-count) "~%"))
        (incf label-count)
      )

      (when (equal "EXECUTE" (elt foo i))
        (format o " jsr ")
        (format o (elt foo (+ i 1)))
        (format o "~%")
      )

      (when (equal "PLAYSOUND1" (elt foo i))
        (format o " lda #%10000001~%")
        (format o " sta $D404~%")
      )

      (when (equal "MUTESOUND1" (elt foo i))
        (format o " lda #%10000000~%")
        (format o " sta $D404~%")
      )

      (when (equal "PLAYSOUND2" (elt foo i))
        (format o " lda #%01000001~%")
        (format o " sta $D40B~%")
      )

      (when (equal "MUTESOUND2" (elt foo i))
        (format o " lda #%01000000~%")
        (format o " sta $D40B~%")
      )

      (when (equal "HITBOXES" (elt foo i))
        (setf foundfunc t)
        (when (not (equal "(" (elt foo (+ i 1))))(format o " lda "))
        (compile-fc code-string (+ i 1))
        (format o " sta $03F2~%")
        (when (not (equal "(" (elt foo i)))(format o " lda "))
        (compile-fc code-string i)
        (format o " sta $03F3~%")
        (when (not (equal "(" (elt foo i)))(format o " lda "))
        (compile-fc code-string i)
        (format o " sta $03F0~%")
        (when (not (equal "(" (elt foo i)))(format o " lda "))
        (compile-fc code-string i)
        (format o " sta $03F1~%")
        (setf foundfunc t)
      )

      (when (equal "COLLISION" (elt foo i))
        (setf foundfunc t)
        (incf i)
        (setf temp1 (parse-integer (elt foo i)))
        (incf i)
        (setf temp2 (parse-integer (elt foo i)))
        (format o " lda #0~%")
        (format o " sta $0340~%")
        (format o " lda $~x~%" (+ #xD000 (* temp1 2)))
        (format o " sta $033C~%")
        (format o " lda $~x~%" (+ #xD001 (* temp1 2)))
        (format o " sta $033E~%")
        (format o " lda $~x~%" (+ #xD000 (* temp2 2)))
        (format o " sta $033D~%")
        (format o " lda $~x~%" (+ #xD001 (* temp2 2)))
        (format o " sta $033F~%")
        (format o " jsr FullCollision~%")
        (format o " ldx $03F0~%")
        (format o " ldy $03F2~%")
        (format o " sty $03F0~%")
        (format o " stx $03F2~%")
        (format o " ldx $03F1~%")
        (format o " ldy $03F3~%")
        (format o " sty $03F1~%")
        (format o " stx $03F3~%")
        (format o " lda $~x~%" (+ #xD000 (* temp2 2)))
        (format o " sta $033C~%")
        (format o " lda $~x~%" (+ #xD001 (* temp2 2)))
        (format o " sta $033E~%")
        (format o " lda $~x~%" (+ #xD000 (* temp1 2)))
        (format o " sta $033D~%")
        (format o " lda $~x~%" (+ #xD001 (* temp1 2)))
        (format o " sta $033F~%")
        (format o " jsr FullCollision~%")
        (format o " lda $0340~%")
        (format o " cmp #1~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "LOADSPRITE" (elt foo i))
        (setf temp2 #x07F8)
        (setf temp1 #x3000)
        (setf temp3 192)
        (format o " ldx #0~%")
        (format o (concatenate 'string " jmp LoadDataNo" (write-to-string label-count) "~%"))
        (format o (concatenate 'string "SpriteDataNo" (write-to-string label-count) "~%"))
        (incf i)
        (setf temp1 (+ temp1 (* (parse-integer (elt foo i)) 64)))
        (setf temp2 (+ temp2 (parse-integer (elt foo i))))
        (setf temp3 (+ temp3 (parse-integer (elt foo i))))
        (incf i)
        (setf bytes 0)
        (loop
          (when (equal ")" (elt foo i))(return))
          (format o " byte #~d," (elt (get-byte (elt foo i)) 0))
          (format o "#~d," (elt (get-byte (elt foo i)) 1))
          (format o "#~d~%" (elt (get-byte (elt foo i)) 2))
          (incf i)
          (setf bytes (+ bytes 3))
        )
        (loop
          (when (>= bytes 64)(return))
          (format o " byte #0,#0,#0~%")
          (setf bytes (+ bytes 3))
        )
        (format o (concatenate 'string "LoadDataNo" (write-to-string label-count) "~%"))
        (format o (concatenate 'string " lda " (concatenate 'string "SpriteDataNo" (write-to-string label-count))))
        (format o ",x~%")
        (format o " sta $~x" temp1)
        (format o ",x~%")
        (format o " inx~%")
        (format o " cpx #$3F~%")
        (format o (concatenate 'string " bne LoadDataNo" (write-to-string label-count) "~%"))
        (incf label-count)
      )

      (when (equal "SETSPRITE" (elt foo i))
        (setf temp2 #x07F8)
        (setf temp3 192)
        (incf i)
        (setf temp2 (+ temp2 (parse-integer (elt foo i))))
        (incf i)
        (setf temp3 (+ temp3 (parse-integer (elt foo i))))
        (incf i)
        (format o (concatenate 'string " lda #" (write-to-string temp3) "~%"))
        (format o " sta $~x~%" temp2)
      )

      (when (equal "ROUTINE" (elt foo i))
        (setf current-routine (elt foo (+ i 1)))
        (format o (concatenate 'string " jmp EXIT" current-routine "~%"))
        (format o current-routine)
        (format o "~%")
        (compile-progn)
        (format o " rts~%")
        (format o (concatenate 'string "EXIT" current-routine "~%"))
      )

      (when (equal "BREAK" (elt foo i))
        (setf foundfunc t)
        (format o (concatenate 'string " jmp ExitLoopNo" (write-to-string (first (last top-loop))) "~%"))
      )

      (when (equal "DRAWSCREEN" (elt foo i))
        (format o " jsr DisplayScore~%")
        (format o " jsr DisplayScore2~%")
        (format o " jsr Wait1~%")
      )

      (when (equal "PLOT" (elt foo i))
        (let ((isfunc nil))
        (incf label-count)
        (when (equal "(" (elt foo (+ i 1)))(setf isfunc t))
        (when (not isfunc) (format o " ldx "))
        (setf didright 1)
        (compile-fc code-string (+ i 1))
        (when isfunc (format o " tax~%"))
        (format o " stx $00FD~%")
        (if (not (equal "(" (elt foo i)))
          (progn
            (format o " ldy ")
            (setf temp1 1)
          )
          (setf temp1 0)
        )
        (compile-fc code-string i)
        (when (zerop temp1)(format o " tay~%"))
        (format o " sty $00FE~%")
        (when (not (equal "(" (elt foo i)))(format o " lda "))
        (compile-fc code-string i)
        (format o " sta $00FF~%")
        (format o "~% jsr CharPlot")
        (setf didright 0)
        )
      )

      (when (equal "PLOTCOLOR" (elt foo i))
        (let ((isfunc nil))
        (incf label-count)
        (when (equal "(" (elt foo (+ i 1)))(setf isfunc t))
        (when (not isfunc) (format o " ldx "))
        (setf didright 1)
        (compile-fc code-string (+ i 1))
        (when isfunc (format o " tax~%"))
        (format o " stx $00FD~%")
        (if (not (equal "(" (elt foo i)))
          (progn
            (format o " ldy ")
            (setf temp1 1)
          )
          (setf temp1 0)
        )
        (compile-fc code-string i)
        (when (zerop temp1)(format o " tay~%"))
        (format o " sty $00FE~%")
        (when (not (equal "(" (elt foo i)))(format o " lda "))
        (compile-fc code-string i)
        (format o " sta $00FF~%")
        (format o "~% jsr ColorPlot")
        (setf didright 0)
        )
      )

      (when (equal "LOOP" (elt foo i))
        (let ((old-lc 0))
          (incf label-count)
          (setf old-lc label-count)
          (if (equal (elt top-loop 0) 'l)
            (setf top-loop (list label-count))
            (setf top-loop (concatenate 'list top-loop (list label-count)))
          )
          (format o (concatenate 'string "LoopNo" (write-to-string label-count) "~%"))
          
          (compile-progn)
          (format o (concatenate 'string " jmp LoopNo" (write-to-string old-lc) "~%"))
          
          (format o (concatenate 'string "ExitLoopNo" (write-to-string old-lc) "~%"))
          (if (equal (length top-loop) 1)
            (setf top-loop (list 'l))
            (pop top-loop)
          )
        )
      )

      (when (equal "WHEN" (elt foo i))
        (let ((old-lc 0))
          (incf label-count)
          (setf old-lc label-count)
          (compile-fc code-string (+ i 1) t)
          (format o (concatenate 'string " BranchNo" (write-to-string label-count) "~%"))
          (format o (concatenate 'string " jmp GotoNo" (write-to-string label-count) "~%"))
          (format o (concatenate 'string "BranchNo" (write-to-string label-count) "~%"))
          (compile-progn)
          (format o (concatenate 'string "GotoNo" (write-to-string old-lc) "~%"))
        )
      )

      (when (equal "EQUAL" (elt foo i))
        (setf foundfunc t)
        (when (not (equal "(" (elt foo (+ i 1))))(format o " lda "))
        (compile-fc code-string (+ i 1))
        (format o " sta $CFFE~%")
        (when (not (equal "(" (elt foo i)))(format o " lda "))
        (if (equal ")" (elt foo i))
          (compile-fc code-string (+ i 1))
          (compile-fc code-string i)
        )
        (format o " sta $CFFD~%")
        (format o " lda $CFFE~%")
        (format o " cmp $CFFD~%")
        (format o " beq")
        (setf foundfunc t)
      )

      (when (equal ">" (elt foo i))
        (setf foundfunc t)
        (when (not (equal "(" (elt foo (+ i 1))))(format o " lda "))
        (compile-fc code-string (+ i 1))
        (format o " sta $CFFE~%")
        
        (when (not (equal "(" (elt foo i)))(format o " lda "))
        (if (equal ")" (elt foo i))
          (compile-fc code-string (+ i 1))
          (compile-fc code-string i)
        )
        (format o " sta $CFFD~%")
        (format o " lda $CFFD~%")
        (format o " cmp $CFFE~%")
        (format o " bcc")
        (setf foundfunc t)
      )

      (when (equal "<" (elt foo i))
        (setf foundfunc t)
        (when (not (equal "(" (elt foo (+ i 1))))(format o " lda "))
        (compile-fc code-string (+ i 1))
        (format o " sta $CFFE~%")
        
        (when (not (equal "(" (elt foo i)))(format o " lda "))
        (if (equal ")" (elt foo i))
          (compile-fc code-string (+ i 1))
          (compile-fc code-string i)
        )
        (format o " sta $CFFD~%")
        (format o " lda $CFFE~%")
        (format o " cmp $CFFD~%")
        (format o " bcc")
        (setf foundfunc t)
      )

      (when (equal "JOYUP" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00000001~%")
        (format o " bit $DC01~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYDOWN" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00000010~%")
        (format o " bit $DC01~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYLEFT" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00000100~%")
        (format o " bit $DC01~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYRIGHT" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00001000~%")
        (format o " bit $DC01~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYFIRE" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00010000~%")
        (format o " bit $DC01~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYUP2" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00000001~%")
        (format o " bit $DC00~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYDOWN2" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00000010~%")
        (format o " bit $DC00~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYLEFT2" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00000100~%")
        (format o " bit $DC00~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYRIGHT2" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00001000~%")
        (format o " bit $DC00~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "JOYFIRE2" (elt foo i))
        (setf foundfunc t)
        (format o " lda #%00010000~%")
        (format o " bit $DC00~%")
        (format o " beq")
        (incf i)
        (setf foundfunc t)
      )

      (when (equal "GOTO" (elt foo i))
        (setf foundfunc t)
        (format o " jmp ")
        (format o (elt foo (+ i 1)))
        (format o "~%")
        (setf i (+ i 2))
        (setf foundfunc t)
      )

      (when (equal "LABEL" (elt foo i))
        (setf foundfunc t)
        (format o (elt foo (+ i 1)))
        (format o "~%")
        (setf i (+ i 2))
        (setf foundfunc t)
      )

      (when (equal "PUT" (elt foo i))
        (setf foundfunc t)
        (when (not (equal "(" (elt foo (+ i 1))))(format o " lda "))
        (compile-fc code-string (+ i 1))
        (setf setting t)
        (when (not (equal "(" (elt foo i)))(format o " sta "))
        (compile-fc code-string i)
        (setf setting nil)
        (setf foundfunc t)
      )

      (when (equal "INDEX" (elt foo i))
        (let ((isfunc nil))
          (when (equal "(" (elt foo (+ i 1)))(setf isfunc t))
          (setf foundfunc t)
          (when setting (format o " tay~%"))
          (when (not isfunc)(format o " ldx "))
          (compile-fc code-string (+ i 1))
          (when isfunc (format o " tax~%"))
          (if setting
            (progn
              (format o " tya~%")
              (format o " sta ")
            )
            (format o " lda ")
          )
          (format o (number-or-var (elt foo i)))
          (format o ",x~%")
          (incf i)
          (setf foundfunc t)
        )
      )


      (when (equal "NEWARRAY" (elt foo i))
        (let ((the-size 0) (do-inc t))
          (loop
            (when (equal ")" (elt foo (+ i the-size)))(return))
            (incf the-size)
          )
          (setf the-size (- the-size 2))
          (setf foundfunc t)
          (setf varname (elt foo (+ i 1)))
          (if (> (length free-locations) 1)
            (progn
              (if (>= (cdr (elt free-locations 1)) the-size)
                (progn
                  (setf do-inc nil)
                  (setf the-location (car (elt free-locations 1)))
                  (setf (cdr (elt free-locations 1)) (- (cdr (elt free-locations 1)) the-size))
                  (setf (car (elt free-locations 1)) (+ (car (elt free-locations 1)) the-size))
                  (when (>= 0 (cdr (elt free-locations 1)))
                    (pop (cdr free-locations))
                  )
                )
                (progn
                  (setf do-inc t)
                  (setf the-location var-address)
                )
              )
            )
            (progn
              (setf the-location var-address)
              (setf do-inc t)
            )
          )
          (collect-garbage varname the-size the-location)
          (setf var-list (concatenate 'list var-list (list varname the-location)))
          (setf i (+ i 2))
          (loop
            (when (equal ")" (elt foo i))(return))
            (when (not (equal "(" (elt foo i)))(format o " lda "))
            (compile-fc code-string i)
            (format o " sta $~x~%" the-location)
            (incf the-location)
            (when do-inc
              (incf var-address)
            )
          )
          (format o (concatenate 'string "; THIS IS " varname "~%"))
          (setf foundfunc t)
        )
      )

      (when (equal "NEWVAR" (elt foo i))
        (let ((do-inc t))
        (setf foundfunc t)
        (setf varname (elt foo (+ i 1)))
        (if (> (length free-locations) 1)
          (progn
            (setf do-inc nil)
            (setf the-location (car (elt free-locations 1)))
            (setf (cdr (elt free-locations 1)) (- (cdr (elt free-locations 1)) 1))
            (setf (car (elt free-locations 1)) (+ (car (elt free-locations 1)) 1))
            (when (>= 0 (cdr (elt free-locations 1)))
              (pop (cdr free-locations))
            )
          )
          (progn
            (setf do-inc t)
            (setf the-location var-address)
          )
        )
        (if (equal "(" (elt foo (+ i 2)))
          (progn
            (compile-fc code-string (+ i 2))
            (format o " lda $CFFF~%")
            
            (format o " sta $~%")
            (format o "~x~%" the-location)
          )
          (progn
            (format o " lda ")
            (compile-fc code-string (+ i 2))
            (format o "~% sta $")
            (format o "~x~%" the-location)
          )
        )
        (when do-inc
          (incf var-address)
        )
        (format o (concatenate 'string "; THIS IS " varname "~%"))
        (collect-garbage varname 1 the-location)
        (setf var-list (concatenate 'list var-list (list varname the-location)))
        (setf foundfunc t)
        )
      )


      (when (equal "+" (elt foo i))
        (setf foundfunc t)
        (if (equal "(" (elt foo (+ i 1)))
          (progn
            (addwith-right)
          )
          (progn
            (if (equal "(" (elt foo (+ i 2)))
              (progn
                (incf i)
                (setf oldi i)
                (addwith-right)
              )
              (progn
                (addwith-nums)
              )
            )
          )
        )
        (setf foundfunc t)
      )
      (when (equal "-" (elt foo i))
        (setf foundfunc t)
        (if (equal "(" (elt foo (+ i 1)))
          (progn
            (subwith-right)
          )
          (progn
            (if (equal "(" (elt foo (+ i 2)))
              (progn
                (incf i)
                (setf oldi i)
                (subwith-right)
              )
              (progn
                (subwith-nums)
              )
            )
          )
        )
        (setf foundfunc t)
      )
      (when (not foundfunc)
        (when (number-or-var (elt foo i))
          (format o (number-or-var (elt foo i)))
        )
      )
      (incf i)
      (when (member i trash-locations)
        (let ((t-index 0)(results (list 'l)))
          (loop
            (when (>= t-index (length trash-locations)) (return))
            (when (equal i (elt trash-locations t-index))
              (setf results (concatenate 'list results (list (elt trash-locations (- t-index 1)))))
            )
            (incf t-index)
          )
          (setf results (remove 'l results))
          (unless brk
            (format o "~%;GARBAGE COLLECTION COMPLETE~%")
            (setf t-index 0)
            (loop
              (when (>= t-index (length results))(return))
              (format o ";$~x IS NOW FREE~%" (car (elt results t-index)))
              (incf t-index)
            )
          )
          (setf free-locations (concatenate 'list free-locations results))
          (setf trash-locations (remove i trash-locations))
          (setf t-index 0)
          (loop
            (when (>= t-index (length results))(return))
            (setf trash-locations (remove (elt results t-index) trash-locations))
            (incf t-index)
          )
        )
      )
      (setf foundfunc nil)
      (unless brk (format o "~%"))
)
