.model small
.stack 200h

.data
    filewrite db "output.txt", 0
    fhandle dw ?
    namestr db "Name : ",0
    square_x      dw 40
    square_y      dw 6
    square_size   db 26
    nam           db "Enter Player name(max 8 chars)$"
    playername    db "$$$$$$$$$"
    arr           db "Player$"
    welcome       db "Welcome to Candy Crush!$"
    arr2          db "Here: $"
    arr3          db "SCORE$"
    arr4          db "MOVES$"
    l1t db     "T: 50$"
    l2t db     "T: 60$"
    l3t db     "T: 70$"
    level1        db "LEVEL 1$"
    level2        db "LEVEL 2$"
    level3        db "LEVEL 3$"
    level1str       db "LEVEL 1 Score:",0
    level2str       db "LEVEL 2 Score:",0
    level3str       db "LEVEL 3 Score:",0
    highscorestring db "High score :",0
    squarel3_x    dw 40
    squarel3_y    dw 6
    squarel3_size db 26
    backsq_x      dw 36
    backsq_y      dw 3
    backsq_size   dw 195
    squarel2_x    dw 40
    squarel2_y    dw 6
    squarel2_size db 26
    diamond_x     dw 42
    diamond_y     dw 7
    ;diamond_size  db 23
    triangle_x    dw 41
    triangle_y    dw 12
    ;triangle_size db 41
    i             dw 0
    jd            dw 7
    jt            dw 12
    count         db 0
    count2        db 0
    dum1    dw 0
      dum2    dw 0
      dum3  dw 0
      radius      dw 11
      cj         dw 8
    arr1 dw 49 dup(6)
    arr2l2 dw 49 dup(6)
    arr3l3 dw 49 dup(6)
      bomb_x dw 52
      bomb_y dw 13
      bomb_z dw 0
      bomb_i dw 0
      bomb_j dw 0
      squareS_x    dw 43
    squareS_y    dw 9
    squareS_size db 20
    previndexX dw 0
      previndexY dw 0
      currindexX dw 0
      currindexY dw 0
      currbox dw 0
      prevbox dw 0
      l1count db 0
      l2count db 0
      score db 0
      moves db 0
      temp dw 0
      counter dw 0
      checkcount dw 0
      row dw 0
      column dw 0
      newlines db 10
      var0 db 123
      var1 db 150
      var2 db 124
      highest db 0
      level1score db 0
      level2score db 0
      level3score db 0
      gameover db "GAME OVER!$"
      congrats db "Congratulations on completing level 1!$"
      congrats2 db "Congratulations on completing level 2!$"
      congrats3 db "Congratulations on completing all levels!$"
      press db "Press any key to continue$"
      gameend db "Game Ended$"
      ins0 db "Instructions:$"
      ins1 db "1. Use mouse cursor to play.$"
      ins2 db "2. Click on two boxes one after another    to swap them.$"
      ins3 db "3. There are total three levels.$"
      ins4 db "4. You have 10 moves to complete each le   vel.$"
      ins5 db "5. Match 3 or more boxes of the same sha   pe to score points.$"
      ins6 db "6. There are 4 types of candies and one    special candy i.e Bomb.$"
      ins7 db "7. A Bomb can spawn after matching candi   es in row or coloumn and will result    in addition of 4 points along with de   struction of a row or column.$"
      ins8 db "8. To pass each you have cross a score t   hreshold.$"
      ins9 db "Press any key to start!$"
.code
level_1 proc
                     mov di,07h
                     mov si,07h
    square_board:    
    squares:         
                     mov dx,square_y
                     mov bh,square_size
    square:          
                     mov bl,square_size
                     MOV cx,square_x
    line:            
                     mov ah,0ch
                     mov al,0ah
                     int 10h
                     inc cx
                     dec bl
                     jnz line
                     inc dx
                     dec bh
                     jnz square
                     add square_x,27
                     dec si
                     jnz squares
                     mov square_x,40
                     add square_y,27
                     mov si,07h
                     dec di
                     jnz square_board

                     mov ah,02h
                     mov bh,00h
                     mov dh,3
                     mov dl,71
                     int 10h
                     mov dx,offset level1
                     mov ah,09h
                     int 21h

                     mov ah,02h
                     mov bh,00h
                     mov dh,19
                     mov dl,71
                     int 10h
                     mov cx,1
                     mov dx,offset arr
                     mov ah,09h
                     mov bh,00h
                     mov bl, 04h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,21
                     mov dl,71
                     int 10h
                     mov dx,offset playername
                     mov ah,09h
                     mov bh,00h
                     mov bl, 04h
                     int 21h
                      mov ah,02h
                     mov bh,00h
                     mov dh,6
                     mov dl,71
                     int 10h
                     mov dx,offset l1t
                     mov ah, 09h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,8
                     mov dl,71
                     int 10h
                     mov dx,offset arr3
                     mov ah, 09h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,13
                     mov dl,71
                     int 10h
                     mov dx,offset arr4
                     mov ah, 09h
                     mov bh, 00h
                     mov bl, 04h
                     int 21h
                     ret

level_1 endp
level_2 proc
;  mov si,offset arr1
;        mov bx,0
;        .while bx<49
;          mov [si],6
;          add si,2
;          inc bx
;        .endw

    ;line 1
                     mov si,07h
    squares_level2:  
                     mov dx,squarel2_y
                     mov bh,squarel2_size
                     cmp si,1
                     je  skip2
                     cmp si,4
                     je  skip2
                     cmp si,7
                     je  skip2

    square_level2:   
                     mov bl,squarel2_size
                     MOV cx,squarel2_x
    line_level2:     
                     mov ah,0ch
                     mov al,03h
                     int 10h
                     inc cx
                     dec bl
                     jnz line_level2
                     inc dx
                     dec bh
                     jnz square_level2
    skip2:           
                     add squarel2_x,27
                     dec si
                     jnz squares_level2

    ;line 2
                     mov squarel2_x,40
                     add squarel2_y,27
                     mov si,07h
    squares_level2l2:
                     mov dx,squarel2_y
                     mov bh,squarel2_size
                     cmp si,1
                     je  skip2l2
                     cmp si,7
                     je  skip2l2

    square_level2l2: 
                     mov bl,squarel2_size
                     MOV cx,squarel2_x
    line_level2l2:   
                     mov ah,0ch
                     mov al,03h
                     int 10h
                     inc cx
                     dec bl
                     jnz line_level2l2
                     inc dx
                     dec bh
                     jnz square_level2l2
    skip2l2:         
                     add squarel2_x,27
                     dec si
                     jnz squares_level2l2


    ;line 3
                     mov squarel2_x,40
                     add squarel2_y,27
                     mov si,07h
    squares_level2l3:
                     mov dx,squarel2_y
                     mov bh,squarel2_size

    square_level2l3: 
                     mov bl,squarel2_size
                     MOV cx,squarel2_x
    line_level2l3:   
                     mov ah,0ch
                     mov al,03h
                     int 10h
                     inc cx
                     dec bl
                     jnz line_level2l3
                     inc dx
                     dec bh
                     jnz square_level2l3
                     add squarel2_x,27
                     dec si
                     jnz squares_level2l3


    ;line 4
                     mov squarel2_x,40
                     add squarel2_y,27
                     mov si,07h
    squares_level2l4:
                     mov dx,squarel2_y
                     mov bh,squarel2_size
                     cmp si,1
                     je  skip2l4
                     cmp si,7
                     je  skip2l4

    square_level2l4: 
                     mov bl,squarel2_size
                     MOV cx,squarel2_x
    line_level2l4:   
                     mov ah,0ch
                     mov al,03h
                     int 10h
                     inc cx
                     dec bl
                     jnz line_level2l4
                     inc dx
                     dec bh
                     jnz square_level2l4
    skip2l4:         
                     add squarel2_x,27
                     dec si
                     jnz squares_level2l4


    ;line 5
                     mov squarel2_x,40
                     add squarel2_y,27
                     mov si,07h
    squares_level2l5:
                     mov dx,squarel2_y
                     mov bh,squarel2_size

    square_level2l5: 
                     mov bl,squarel2_size
                     MOV cx,squarel2_x
    line_level2l5:   
                     mov ah,0ch
                     mov al,03h
                     int 10h
                     inc cx
                     dec bl
                     jnz line_level2l5
                     inc dx
                     dec bh
                     jnz square_level2l5
                     add squarel2_x,27
                     dec si
                     jnz squares_level2l5



    ;line 6
                     mov squarel2_x,40
                     add squarel2_y,27
                     mov si,07h
    squares_level2l6:
                     mov dx,squarel2_y
                     mov bh,squarel2_size
                     cmp si,1
                     je  skip2l6
                     cmp si,7
                     je  skip2l6

    square_level2l6: 
                     mov bl,squarel2_size
                     MOV cx,squarel2_x
    line_level2l6:   
                     mov ah,0ch
                     mov al,03h
                     int 10h
                     inc cx
                     dec bl
                     jnz line_level2l6
                     inc dx
                     dec bh
                     jnz square_level2l6
    skip2l6:         
                     add squarel2_x,27
                     dec si
                     jnz squares_level2l6

    ;line 7
                     mov squarel2_x,40
                     add squarel2_y,27
                     mov si,07h
    squares_level2l7:
                     mov dx,squarel2_y
                     mov bh,squarel2_size
                     cmp si,1
                     je  skip2l7
                     cmp si,4
                     je  skip2l7
                     cmp si,7
                     je  skip2l7

    square_level2l7: 
                     mov bl,squarel2_size
                     MOV cx,squarel2_x
    line_level2l7:   
                     mov ah,0ch
                     mov al,03h
                     int 10h
                     inc cx
                     dec bl
                     jnz line_level2l7
                     inc dx
                     dec bh
                     jnz square_level2l7
    skip2l7:         
                     add squarel2_x,27
                     dec si
                     jnz squares_level2l7


                     mov ah,02h
                     mov bh,00h
                     mov dh,4
                     mov dl,71
                     int 10h
                     mov dx,offset level2
                     mov ah,09h
                     int 21h

                     mov ah,02h
                     mov bh,00h
                     mov dh,19
                     mov dl,71
                     int 10h
                     mov cx,1
                     mov dx,offset arr
                     mov ah,09h
                     mov bh,00h
                     mov bl, 04h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,21
                     mov dl,71
                     int 10h
                     mov dx,offset playername
                     mov ah,09h
                     mov bh,00h
                     mov bl, 04h
                     int 21h
                      mov ah,02h
                     mov bh,00h
                     mov dh,6
                     mov dl,71
                     int 10h
                     mov dx,offset l2t
                     mov ah, 09h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,8
                     mov dl,71
                     int 10h
                     mov dx,offset arr3
                     mov ah, 09h
                     mov bh, 00h
                     mov bl, 04h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,13
                     mov dl,71
                     int 10h
                     mov dx,offset arr4
                     mov ah, 09h
                     mov bh, 00h
                     mov bl, 04h
                     int 21h
                     
                     



                     ret
level_2 endp
level_3 proc

                     mov di,07h
                     mov si,07h
    level_3_board:   
                     cmp di,04h
                     je  skip22
    squares_level3:  
                     mov dx,squarel3_y
                     mov bh,squarel3_size
                     cmp si,04h
                     je  skip1
    square_level3:   
                     mov bl,squarel3_size
                     MOV cx,squarel3_x
                     cmp si,04h
    line_level3:     
                     mov ah,0ch
                     mov al,07h
                     int 10h
                     inc cx
                     dec bl
                     jnz line_level3
                     inc dx
                     dec bh
                     jnz square_level3
    skip1:           
                     add squarel3_x,27
                     dec si
                     jnz squares_level3
    skip22:          
                     mov squarel3_x,40
                     add squarel3_y,27
                     mov si,07h
                     dec di
                     jnz level_3_board
                     mov ah,02h
                     mov bh,00h
                     mov dh,5
                     mov dl,71
                     int 10h
                     mov dx,offset level3
                     mov ah,09h
                     int 21h

                      mov ah,02h
                     mov bh,00h
                     mov dh,19
                     mov dl,71
                     int 10h
                     mov cx,1
                     mov dx,offset arr
                     mov ah,09h
                     mov bh,00h
                     mov bl, 04h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,21
                     mov dl,71
                     int 10h
                     mov dx,offset playername
                     mov ah,09h
                     mov bh,00h
                     mov bl, 04h
                     int 21h
                      mov ah,02h
                     mov bh,00h
                     mov dh,6
                     mov dl,71
                     int 10h
                     mov dx,offset l3t
                     mov ah, 09h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,8
                     mov dl,71
                     int 10h
                     mov dx,offset arr3
                     mov ah, 09h
                     mov bh, 00h
                     mov bl, 04h
                     int 21h
                     mov ah,02h
                     mov bh,00h
                     mov dh,13
                     mov dl,71
                     int 10h
                     mov dx,offset arr4
                     mov ah, 09h
                     mov bh, 00h
                     mov bl, 04h
                     int 21h



                     ret
level_3 endp

backsquare proc
                     mov dx,backsq_y
                     mov bx,backsq_size
    backsq:          
                     mov bp,backsq_size
                     MOV cx,backsq_x
    backline:        
                     mov ah,0ch
                     mov al,05h
                     int 10h
                     inc cx
                     dec bp
                     jnz backline
                     inc dx
                     dec bx
                     jnz backsq
                     ret
backsquare endp

diamond proc
    push si
    ;upper triangle

                     mov dx,jd
                     mov bx,1h
                     mov cx,i
                     add cx,11
.while cx>i
                     mov di,bx
                     mov si,cx
.while di>0
                     mov ah,0ch
                     mov al,0fh
                     int 10h
                     dec di
                     inc cx
.endw
         mov cx,si
         add bx,2
         dec cx
         inc dx
.endw

    ;lower triangle
         mov bp,i
         add bp,11

.while cx<=bp
         mov di,bx
         mov si,cx
.while di>0
         mov ah,0ch
         mov al,0fh
         int 10h
         dec di
         inc cx
.endw
         mov cx,si
         sub bx,2
         inc cx
         inc dx
.endw

pop si


             ret
   

diamond endp

triangle proc

            push si

             mov dx,jt
             mov bx,1
             mov cx,i
             add cx,12
.while cx>i
             mov di,bx
             mov si,cx
.while di>0
             mov ah,0ch
             mov al,04h
             int 10h
             dec di
             inc cx
.endw
         mov cx,si
         add bx,2
         dec cx
         inc dx
.endw
pop si
               ret

triangle endp
square_shape proc
push si
           mov dx,squareS_y
           mov bh,squareS_size
    squareshape:
           mov bl,squareS_size
           MOV cx,i
    linesquare:  
           mov ah,0ch
           mov al,09h
           int 10h
           inc cx
           dec bl
           jnz linesquare
           inc dx
           dec bh
           jnz squareshape

           pop si



      ret

square_shape endp
fillsquare_shape proc
push si
           mov dx,square_y
           mov bh,square_size
    fillsquareshape:
           mov bl,square_size
           MOV cx,i
    filllinesquare:  
           mov ah,0ch
           mov al,0ah
           int 10h
           inc cx
           dec bl
           jnz filllinesquare
           inc dx
           dec bh
           jnz fillsquareshape

           pop si



      ret

fillsquare_shape endp
fillsquare_shapel2 proc
push si
           mov dx,square_y
           mov bh,square_size
    fillsquareshapel2:
           mov bl,square_size
           MOV cx,i
    filllinesquarel2:  
           mov ah,0ch
           mov al,03h
           int 10h
           inc cx
           dec bl
           jnz filllinesquarel2
           inc dx
           dec bh
           jnz fillsquareshapel2

           pop si



      ret

fillsquare_shapel2 endp
fillsquare_shapel3 proc
push si
           mov dx,square_y
           mov bh,square_size
    fillsquareshapel3:
           mov bl,square_size
           MOV cx,i
    filllinesquarel3:  
           mov ah,0ch
           mov al,07h
           int 10h
           inc cx
           dec bl
           jnz filllinesquarel3
           inc dx
           dec bh
           jnz fillsquareshapel3

           pop si



      ret

fillsquare_shapel3 endp
circle proc
push si
            mov  di, 0
            mov  si, 0
.while di<100
           mov  si, 0
.while si<=100

           push di
           push si
.if si>radius
           sub  si, radius
           mov  dum1, si
.else
         mov ax, radius
         sub ax, si
         mov dum1, ax
.endif

          mov ax, dum1

          mov bx, ax
          mul bx
          mov dum1, ax

.if di>radius
          sub di, radius
          mov dum2, di
.else
         mov ax, radius
         sub ax, di
         mov dum2, ax

.endif
          mov ax, dum2

          mov bx, ax
          mul bx
          mov dum2, ax

          mov ax, radius
          mov bx, radius
          mul bx

          mov dum3, ax
          mov ax, dum1
          add ax, dum2

          pop si
          pop di

.if ax<=dum3

          mov ah, 0ch

          mov al, 1h            

          mov cx, si        ; column 0 to 639
          add cx,i

          mov dx, di        ; row 0 to 199
          add dx,cj

          int 10h

.endif

          inc si
.endw

         inc di
.endw

      pop si


           ret
circle endp
bomb proc
         push SI
         push di
         push ax
         push bx
         push CX
         push DX
    ; rectangle 1
         sub  i,10
         mov  si,i
         push si
         mov  di,bomb_j
         mov  bomb_z,di
         push di
         add  bomb_z,16
.while di<=bomb_z
         push bomb_z
         mov  ax,i
         mov  bomb_z,ax
         add  bomb_z,7
.while si<=bomb_z
         mov  ah,0Ch
         mov  al,04h
         mov  cx,si
         mov  dx,di
         mov  bh,0
         int  10h
         inc  si
.endw
         inc di
         mov si,i
         pop bomb_z
.endw


    ; rectangle 2
         pop  di
         pop  si
         push SI
         push di
         push si
         push di
         add  si,15
         mov  i,si
         mov  bomb_z,di
         add  bomb_z,16
.while di<=bomb_z
         push bomb_z
         mov  ax,i
         mov  bomb_z,ax
         add  bomb_z,7
.while si<=bomb_z
         mov  ah,0Ch
         mov  al,04h
         mov  cx,si
         mov  dx,di
         mov  bh,0
         int  10h
         inc  si
.endw
         inc di
         mov si,i
         pop bomb_z
.endw
	
    ; making small strips on rectangle
         pop di
         pop si
         sub di,5
         add si,1
         mov i,si
         mov bomb_z,0
         mov bomb_j,0
.while bomb_j<=3
.while bomb_z<=5
         mov ah,0Ch
         mov al,0Eh
         mov cx,si
         mov dx,di
         mov bh,0
         int 10h
         inc si
         inc bomb_z
.endw
         inc di
         inc bomb_j
         mov bomb_z,0
         mov si,i
.endw


         pop  di
         pop  si
         push SI
         push di
         sub  di,5
         add  si,8
         mov  i,si
         mov  bomb_z,0
         mov  bomb_j,0
.while bomb_j<=3
.while bomb_z<=5
         mov  ah,0Ch
         mov  al,0Eh
         mov  cx,si
         mov  dx,di
         mov  bh,0
         int  10h
         inc  si
         inc  bomb_z
.endw
         inc di
         inc bomb_j
         mov bomb_z,0
         mov si,i
.endw


         pop di
         pop si
         sub di,5
         add si,15
         mov i,si
         mov bomb_z,0
         mov bomb_j,0
.while bomb_j<=3
.while bomb_z<=5
         mov ah,0Ch
         mov al,0Eh
         mov cx,si
         mov dx,di
         mov bh,0
         int 10h
         inc si
         inc bomb_z
.endw
         inc di
         inc bomb_j
         mov bomb_z,0
         mov si,i
.endw


         pop  dx
         pop  cx
         pop  bx
         pop  ax
         pop  di
         pop  si
         ret
bomb endp
delay proc
               push ax
               push bx
               push cx
               push dx
               mov  cx,250
    startLoop: 
               mov  ax,00h
               push CX
               mov  cx,250
    innerloop: 
               mov  ax,00h
               mov  dx,5344
               mov  bx,5000
               Loop innerloop
               pop  cx
               Loop startLoop
               pop  dx
               pop  cx
               pop  bx
               pop  ax
               ret
delay endp
delayl2 proc
               push ax
               push bx
               push cx
               push dx
               mov  cx,250
    startLoopl2: 
               mov  ax,00h
               push CX
               mov  cx,250
    innerloopl2: 
               mov  ax,00h
               mov  dx,5344
               mov  bx,5000
               Loop innerloopl2
               pop  cx
               Loop startLoopl2
               pop  dx
               pop  cx
               pop  bx
               pop  ax
               ret
delayl2 endp

populatel1 proc
        mov count,0
        mov count2,0
        mov i,0 
        mov jt,12
        mov jd,7
        mov cj,8
        mov bomb_j,0
        mov bomb_y,13
        mov squareS_y,9
      mov si,offset arr1
.while count2<7
.while count<7
.if(l1count==0)
               MOV  AH, 00h          ; interrupts to get system time
               INT  1AH              ; CX:DX now hold number of clock ticks since midnight
               mov  ax,dx
               mov  dx,0
               mov  cx,4
               div  cx
               mov [si],dx
.endif
               mov dx,[si]
.if dx==0
               mov  bx,triangle_x
.if count==0
               add  i,bx
               call triangle
.else
         add  i,27
         call triangle
.endif
.elseif dx==1
          mov  bx,diamond_x
.if count==0
          add  i,bx
          call diamond
.else
         add  i,27
         call diamond
.endif
.elseif dx==2
          mov  bx,42
.if count==0
          add  i,bx
          call circle
.else
         add  i,27
         call circle
.endif
.elseif dx==3
mov  bx,squareS_x
.if count==0
          add  i,bx
          call square_shape
.else
         add  i,28          
         call square_shape
         sub i,1
.endif
         
.elseif dx==4
          mov  bx,bomb_x
.if count==0
          add  i,bx
          mov bx,bomb_y
          mov bomb_j,bx
          call bomb
          sub i,16
.else
         add  i,37
         mov bx,bomb_y
          mov bomb_j,bx            
         call bomb
          sub i,16
.endif

.endif
          inc  count
    ;inc count2
    .if l1count==0
          call delay
            .endif
          add si,2
.endw
         mov count,0
         inc count2
         mov i,0
         add jt,27
         add jd,27
         add cj,27
         add bomb_y,27
         add squareS_y,27
.endw
         inc l1count
         .if l2count==0
         call checkHorizontalCrush
         call checkVerticalCrush
         .endif

         inc l2count

               ret

populatel1 endp
populatel2 proc     


        mov count,0
        mov count2,0
        mov i,0 
        mov jt,12
        mov jd,7
        mov cj,8
        mov bomb_j,0
        mov bomb_y,13
        mov squareS_y,9
      mov si, offset arr2l2
.while count2<7
.while count<7
.if l1count==0
               MOV  AH, 00h          ; interrupts to get system time
               INT  1AH              ; CX:DX now hold number of clock ticks since midnight
               mov  ax,dx
               mov  dx,0
               mov  cx,4
               div  cx
              ; mov [si],dx
.else              
                  mov dx,[si]
.endif
.if dx==0
               mov  bx,triangle_x
.if count==0
               add  i,bx
               .if count2==2
               mov [si],dx
                  ;inc si
               call triangle

               .elseif count2==4
                  mov [si],dx
               ;   inc si
                call triangle
                .endif
.elseif count==6
                add  i,27
                .if count2==2
                  mov [si],dx
                ;  inc si
               call triangle
               .elseif count2==4
                  mov [si],dx
                 ; inc si
                call triangle
                .endif
              ; call triangle
.elseif count==3
            .if count2==0
            add  i,27
            .elseif count2==6
            add  i,27
            .else 
            add  i,27
            mov [si],dx
            ;inc si
            call triangle
            .endif
.else
         add  i,27
            mov [si],dx
           ; inc si
         call triangle
.endif
.elseif dx==1
          mov  bx,diamond_x
.if count==0
          add  i,bx
          .if count2==2
               mov [si],dx
                 ; inc si
               call diamond
               .elseif count2==4
                  mov [si],dx
                 ; inc si
                call diamond
                .endif
          ;call diamond
.elseif count==6
            add  i,27
            .if count2==2
                  mov [si],dx
                   ;     inc si
               call diamond
               .elseif count2==4
                  mov [si],dx
                  ;      inc si
                call diamond
                .endif
.elseif count==3
            .if count2==0
            add  i,27
            .elseif count2==6
            add  i,27
            .else
            add  i,27
            mov [si],dx
          ;  inc si
            call diamond
            .endif
.else
         add  i,27
            mov [si],dx
           ; inc si
         call diamond
.endif
.elseif dx==2
          mov  bx,42
.if count==0
          add  i,bx
          .if count2==2
                  mov [si],dx
             ;           inc si
               call circle
               .elseif count2==4
                  mov [si],dx
              ;          inc si
                call circle
                .endif
          ;call diamond
.elseif count==6
            add  i,27
            .if count2==2
                  mov [si],dx
               ;         inc si
               call circle
               .elseif count2==4
                  mov [si],dx
                ;        inc si
                call circle
                .endif
.elseif count==3
            .if count2==0
            add  i,27
            .elseif count2==6
            add  i,27
            .else
            add  i,27
            mov [si],dx
           ; inc si
            call circle
            .endif
.else
         add  i,27
            mov [si],dx
            ;inc si
         call circle
.endif
.elseif dx==3
  mov  bx,squareS_x
.if count==0
          add  i,bx
          .if count2==2
                  mov [si],dx
             ;           inc si
               call square_shape
               .elseif count2==4
                  mov [si],dx
              ;          inc si
                call square_shape
                .endif
                sub i,1
          ;call diamond
.elseif count==6
            add  i,28
            .if count2==2
                  mov [si],dx
               ;         inc si
               call square_shape
               .elseif count2==4
                  mov [si],dx
                ;        inc si
                call square_shape
                .endif
                sub i,1
.elseif count==3
            .if count2==0
            add  i,27
            .elseif count2==6
            add  i,27
            .else
            add  i,28
            mov [si],dx
            ;inc si
            call square_shape
            sub i,1
            .endif
.else
         add  i,28
            mov [si],dx
            ;inc si
         call square_shape
            sub i,1
.endif
          
.elseif dx==4
mov  bx,bomb_x
.if count==0
          add  i,bx
          .if count2==2
                  mov bx,bomb_y
                  mov bomb_j,bx
                  mov [si],dx
             ;           inc si
               call bomb
               sub i,16
               .elseif count2==4
                  mov bx,bomb_y
                  mov bomb_j,bx
                  mov [si],dx
              ;          inc si
                call bomb
                  sub i,16
            .else 
            sub i,10
                .endif
          ;call diamond
.elseif count==6
            add  i,37
            .if count2==2
                  mov bx,bomb_y
                  mov bomb_j,bx
                  mov [si],dx
               ;         inc si
               call bomb
                  sub i,16
               .elseif count2==4
                  mov bx,bomb_y
                  mov bomb_j,bx
                  mov [si],dx
                ;        inc si
                call bomb
                  sub i,16
                .endif
.elseif count==3
            .if count2==0
            add  i,27
            .elseif count2==6
            add  i,27
            .else
            add  i,37
            mov bx,bomb_y
            mov bomb_j,bx
            mov [si],dx
            ;inc si
            call bomb
            sub i,16
            .endif
.else
         add  i,37
            mov bx,bomb_y
                  mov bomb_j,bx
            mov [si],dx
            ;inc si
         call bomb
            sub i,16
.endif
        
.elseif dx==6
.if count==0
         add i,42
.else
         add i,27
.endif
            

.endif
          inc  count
    ;inc count2
    .if l1count==0
          call delayl2
          .endif
            add si,2
.endw
         mov count,0
         inc count2
         mov i,0
         add jt,27
         add jd,27
         add cj,27
         add bomb_y,27
            add squareS_y,27
.endw
         inc l1count
         .if l2count==0
         call checkHorizontalCrushl2
         call checkVerticalCrushl2
         .endif
   inc l2count
               ret

populatel2 endp
populatel3 proc
      mov si, offset arr3l3

 mov count,0
        mov count2,0
        mov i,0 
        mov jt,12
        mov jd,7
        mov cj,8
            mov bomb_j,0
            mov bomb_y,13
            mov squareS_y,9
.while count2<7
.while count<7
.if l1count==0
               MOV  AH, 00h          ; interrupts to get system time
               INT  1AH              ; CX:DX now hold number of clock ticks since midnight
               mov  ax,dx
               mov  dx,0
               mov  cx,4
               div  cx
.else
               mov dx,[si]
.endif
.if dx==0
               mov  bx,triangle_x
.if count2==3
               add  i,27
.elseif count==0
            add  i,bx
            mov [si],dx
            ;inc si                            
            call triangle
.elseif count==3
            add  i,27
.else
         add  i,27
            mov [si],dx
           ; inc si
         call triangle
.endif
.elseif dx==1
          mov  bx,diamond_x
.if count2==3
          add i,27
.elseif count==0
             add  i,bx
            mov [si],dx
            ;inc si
          call diamond
.elseif count==3
            add  i,27
.else
         add  i,27
            mov [si],dx
            ;inc si
         call diamond
.endif
.elseif dx==2
          mov  bx,42
.if count2==3
          add i,27
.elseif count==0
             add  i,bx
            mov [si],dx
            ;inc si
          call circle
.elseif count==3
            add  i,27
.else
         add  i,27
            mov [si],dx
            ;add si,2
         call circle
.endif
.elseif dx==3
           mov  bx,squareS_x
.if count2==3
          add i,27
.elseif count==0
             add  i,bx
            mov [si],dx
            ;add si,2
          call square_shape
          sub i,1
.elseif count==3
            add  i,27
.else
         add  i,28
            mov [si],dx
            ;inc si
         call square_shape
            sub i,1
.endif
.elseif dx==4
mov  bx,bomb_x
.if count2==3
          add i,27
.elseif count==0
             add  i,bx
              mov bx,bomb_y
              mov bomb_j,bx
                  mov [si],dx
            ;add si,2
          call bomb
              sub i,16
.elseif count==3
            add  i,27
.else
         add  i,37
            mov bx,bomb_y
              mov bomb_j,bx
              mov [si],dx
            ;add si,2

         call bomb
            sub i,16
.endif
.elseif dx==6
.if count==0
         add i,42
.else
         add i,27
.endif
        

.endif
          inc  count
          .if l1count==0
          call delay
            .endif
          add si,2
.endw
         mov count,0
         inc count2
         mov i,0
         add jt,27
         add jd,27
         add cj,27
            add bomb_y,27
            add squareS_y,27
.endw
         inc l1count
         .if l2count==0
         call checkHorizontalCrushl3
         call VerticalCrushl3
         .endif

      inc l2count
               ret

populatel3 endp
setmouserange proc
 mov ax,0
 int 33h
 mov ax,1
 int 33h
mov cx,80
mov dx,451           ;53 difference horizontal
mov ax,7
int 33h
mov cx,6
mov dx,188           ;26 diiference vertical
mov ax,8
int 33h
; mov cx,5
; mov dx,5
; mov ax,0fh
; int 33h
ret
setmouserange endp
GetMouseCurrentPos proc
	
		mov ax,3
		int 33h
		; cx will contain the x-cordinate
		; dx will contain the y-cordinate
		ret
GetMouseCurrentPos endp
GetButtonPressedInfo proc
	
		mov ax,5
		int 33h
		; if ax =2, it is right pressed
		; if ax =1 it  is left pressed	
		ret	
GetButtonPressedInfo endp
swap proc
   mov si,offset arr1
   mov bx,prevbox
   add bx,prevbox
   add si,bx
   mov dx,[si]
    mov si,offset arr1
   mov bx,currbox
   add bx,currbox
   add si,bx
   mov cx,[si]
   mov [si],dx
     mov si,offset arr1
   mov bx,prevbox
   add bx,prevbox
   add si,bx
   mov [si],cx

   ret
swap endp
swapl2 proc
   mov si,offset arr2l2
   mov bx,prevbox
   add bx,prevbox
   add si,bx
   mov dx,[si]
    mov si,offset arr2l2
   mov bx,currbox
   add bx,currbox
   add si,bx
   mov cx,[si]
   mov [si],dx
     mov si,offset arr2l2
   mov bx,prevbox
   add bx,prevbox
   add si,bx
   mov [si],cx

   ret
swapl2 endp
swapl3 proc
   mov si,offset arr3l3
   mov bx,prevbox
   add bx,prevbox
   add si,bx
   mov dx,[si]
    mov si,offset arr3l3
   mov bx,currbox
   add bx,currbox
   add si,bx
   mov cx,[si]
   mov [si],dx
     mov si,offset arr3l3
   mov bx,prevbox
   add bx,prevbox
   add si,bx
   mov [si],cx

   ret
swapl3 endp
checkleftclick proc
   mov previndexX,cx
   mov previndexY,dx
   mov ax,previndexX
   sub ax,80
   mov bl,53
   div bl
  mov cl,al
  mov ax,previndexY
  sub ax,6
  mov bl,26
   div bl
   mov ah,0
   mov ch,7
   mul ch
   mov ch,0
   add ax,cx
   ;mov prevbox,al

 
   ret




checkleftclick endp
HorizontalCrush proc   


   mov counter,0
   ;mov score,0
    mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<8
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+2])
                     .if(ax==arr1[si+4])
                     .if(ax==arr1[si+6])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+4],dx
                       call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+6],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shape
                          add i,27
                          call fillsquare_shape
                           add i,27
                           call fillsquare_shape
                           add i,27
                           call fillsquare_shape
                           .if (arr1[si]==4)
                              .if (arr1[si+2]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+2],dx
                                 .endif
                              .if (arr1[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+4],dx
                                 .endif
                                 .if (arr1[si+6]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+6],dx
                              .endif
                              add score,4
                              call populatel1
                              call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si],2
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              mov ax,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*42)],dx                                                            
                            .elseif (arr1[si+2]==4)
                              .if (arr1[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+4],dx
                                 .endif
                                  .if (arr1[si+6]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+6],dx
                              .endif
                              add score,4
                              call populatel1
                              call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+2],2
                              inc counter
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                               mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape     
                               mov ax,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*42)],dx                       
                            
                              .elseif (arr1[si+4]==4)
                               .if (arr1[si+6]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+6],dx
                                 .endif
                                 add score,4
                              call populatel1
                              add counter,2
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                               mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                               mov ax,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*42)],dx
                           .elseif (arr1[si+6]==4)
                              call populatel1
                              add score,4
                              add counter,3
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                               mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                               mov ax,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*42)],dx
                              
                           .endif
                           call populatel1
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,4
                           mov cl,10
                              mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h

                           .endif
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw
                 ; mov checkcount,0
    mov counter,0

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<10
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+2])
                     .if(ax==arr1[si+4])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+4],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shape
                          add i,27
                          call fillsquare_shape
                           add i,27
                           call fillsquare_shape
                           .if (arr1[si]==4)
                              .if (arr1[si+2]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+2],dx
                                 .endif
                              .if (arr1[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+4],dx
                              .endif
                              add score,4
                              call populatel1
                              call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si],2
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              mov ax,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*42)],dx                                                            
                            .elseif (arr1[si+2]==4)
                              .if (arr1[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+4],dx
                              .endif
                              add score,4
                              call populatel1
                              call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+2],2
                              inc counter
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                               mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape     
                               mov ax,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*42)],dx                       
                            
                              .elseif (arr1[si+4]==4)
                              call populatel1
                              add score,4
                              add counter,2
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                               mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                              add square_y,27
                              call fillsquare_shape
                               mov ax,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+(2*42)],dx
                              
                           .endif

                           call populatel1
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,3
                           mov cl,10
                             mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                 ; inc counter
                  add di,2
                  mov si,temp
                  .endw
                ;  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
HorizontalCrush endp
 HorizontalCrushl2 proc   
 mov counter,0
   ;mov score,0
    mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<8
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+2])
                     .if(ax==arr2l2[si+4])
                     .if(ax==arr2l2[si+6])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+4],dx
                       call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+6],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel2
                          add i,27
                          call fillsquare_shapel2
                           add i,27
                           call fillsquare_shapel2
                           add i,27
                           call fillsquare_shapel2
                           .if (arr2l2[si]==4)
                              .if (arr2l2[si+2]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+2],dx
                                 .endif
                              .if (arr2l2[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+4],dx
                                 .endif
                                 .if (arr2l2[si+6]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+6],dx
                              .endif
                              add score,4
                              call populatel2
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              .if (counter==0||counter==6)
                               ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              .elseif (counter==3)
                               ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              .endif
                              mov ax,counter
                              mov bp,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                              .if (bp==0||bp==6)
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                              .elseif (bp==3)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*42)],dx
                                  .endif                                                            
                            .elseif (arr2l2[si+2]==4)
                              .if (arr2l2[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+4],dx
                                 .endif
                                  .if (arr2l2[si+6]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+6],dx
                              .endif
                              add score,4
                              call populatel2
                              inc counter
                               mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              .if (counter==0||counter==6)
                               ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              .elseif (counter==3)
                               ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              .endif
                              mov ax,counter
                              mov bp,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                              .if (bp==0||bp==6)
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                              .elseif (bp==3)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*42)],dx
                                  .endif                           
                            
                              .elseif (arr2l2[si+4]==4)
                               .if (arr2l2[si+6]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+6],dx
                                 .endif
                              add score,4
                              call populatel2
                              add counter,2
                             mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              .if (counter==0||counter==6)
                               ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              .elseif (counter==3)
                               ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              .endif
                              mov ax,counter
                              mov bp,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                              .if (bp==0||bp==6)
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                              .elseif (bp==3)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*42)],dx
                                  .endif     
                           .elseif (arr2l2[si+6]==4)
                           add score,4
                              call populatel1
                              add counter,3
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              .if (counter==0||counter==6)
                               ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              .elseif (counter==3)
                               ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              .endif
                              mov ax,counter
                              mov bp,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                              .if (bp==0||bp==6)
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                              .elseif (bp==3)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*42)],dx
                                  .endif     
                              
                           .endif
                           call populatel2
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,4
                           mov cl,10
                             mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  ;inc counter
                  add di,2
                  mov si,temp
                  .endw
                ;  dec counter
                  add si,2
                  .endw


   mov counter,0
   ;mov score,0
   

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<10
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+2])
                     .if(ax==arr2l2[si+4])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+4],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel2
                          add i,27
                          call fillsquare_shapel2
                           add i,27
                           call fillsquare_shapel2
                             .if (arr2l2[si]==4)
                              .if (arr2l2[si+2]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+2],dx
                                 .endif
                              .if (arr2l2[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+4],dx
                                 .endif
                                 add score,4
                              call populatel2
                              mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              .if (counter==0||counter==6)
                               ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              .elseif (counter==3)
                               ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              .endif
                              mov ax,counter
                              mov bp,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                              .if (bp==0||bp==6)
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                              .elseif (bp==3)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*42)],dx
                                  .endif                                                            
                            .elseif (arr2l2[si+2]==4)
                              .if (arr2l2[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+4],dx
                                 .endif
                                 add score,4
                              call populatel2
                              inc counter
                               mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              .if (counter==0||counter==6)
                               ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              .elseif (counter==3)
                               ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              .endif
                              mov ax,counter
                              mov bp,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                              .if (bp==0||bp==6)
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                              .elseif (bp==3)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*42)],dx
                                  .endif                           
                            
                              .elseif (arr2l2[si+4]==4)
                              add score,4
                              call populatel2
                              add counter,2
                             mov bx,counter
                              .while(bx>=7)
                              sub bx,7
                              .endw
                              mov counter,bx
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add i,27
                              dec bx
                              .endw
                              .if (counter==0||counter==6)
                               ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2
                              .elseif (counter==3)
                               ;call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              add square_y,27
                              call fillsquare_shapel2
                              .endif
                              mov ax,counter
                              mov bp,counter
                              mov bl,2
                              mul bl
                              mov counter,ax
                              mov bx,0
                              .while bx<counter
                              add bx,2
                              .endw
                              .if (bp==0||bp==6)
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                              .elseif (bp==3)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*7)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*14)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*21)],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*28)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*35)],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+(2*42)],dx
                                  .endif   
                              
                           .endif

                           call populatel2
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,3
                           mov cl,10
                          mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
               ;   inc counter
                  add di,2
                  mov si,temp
                  .endw
                ;  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
HorizontalCrushl2 endp
HorizontalCrushl3 proc   


   mov counter,0
   ;mov score,0
   

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .if(si!=6)
      .while di<10
      .if(di!=6)
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr3l3[si]
                  .if(ax==arr3l3[si+2])
                     .if(ax==arr3l3[si+4])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr3l3[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr3l3[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr3l3[si+4],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel3
                          add i,27
                          call fillsquare_shapel3
                           add i,27
                           call fillsquare_shapel3
                           .if (arr3l3[si]==4)
                              .if (arr3l3[si+2]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[si+2],dx
                                 .endif
                              .if (arr3l3[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[si+4],dx
                              .endif
                              add score,4
                              call populatel3
                              mov ax,counter
                              mov column,ax
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov row,ax
                              mov bx,column
                              .while bx>=7
                              sub bx,7
                              .endw
                              mov column,bx
                              mov i,40
                              mov square_y,6
                              mov bx,0
                              .if (column==0)&& (row<=2)
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx

                              .elseif (column==0)&& (row>2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                               call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                             
                              .elseif (column==1)&& (row<=2)
                              add i,27
                               call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,2
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx                             

                              .elseif (column==1)&& (row>2)
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,2
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx

                              .elseif (column==2)&& (row<=2)
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,4
                              MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                             
                              .elseif (column==2)&& (row>2)
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,4
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx


                              .elseif (column==4)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,8
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                             
                              .elseif (column==4)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,8
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                              .elseif (column==5)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,10
                                 MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                              .elseif (column==5)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,10
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                              
                              .elseif (column==6)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,12
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                              .elseif (column==6)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27

                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,12
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx 

                              .endif

                  
                                                         
                                                                               
                            .elseif (arr3l3[si+2]==4)
                              .if (arr3l3[si+4]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[si+4],dx
                              .endif
                              add score,4
                              call populatel3
                              inc counter
                              mov ax,counter
                              mov column,ax
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov row,ax
                              mov bx,column
                              .while bx>=7
                              sub bx,7
                              .endw
                              mov column,bx
                              mov i,40
                              mov square_y,6
                              mov bx,0
                              .if (column==0)&& (row<=2)
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx

                              .elseif (column==0)&& (row>2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                               call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                             
                              .elseif (column==1)&& (row<=2)
                              add i,27
                               call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,2
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx                             

                              .elseif (column==1)&& (row>2)
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,2
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx

                              .elseif (column==2)&& (row<=2)
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,4
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                             
                              .elseif (column==2)&& (row>2)
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,4
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx


                              .elseif (column==4)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,8
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                             
                              .elseif (column==4)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,8
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                              .elseif (column==5)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,10
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                              .elseif (column==5)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,10
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                              
                              .elseif (column==6)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,12
                                 MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                              .elseif (column==6)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27

                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,12
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx 
                                 .endif
                                                  
                              
                                          
                            
                              .elseif (arr3l3[si+4]==4)
                              add score,4
                              call populatel3
                              add counter,2
                              mov ax,counter
                              mov column,ax
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov row,ax
                              mov bx,column
                              .while bx>=7
                              sub bx,7
                              .endw
                              mov column,bx
                              mov i,40
                              mov square_y,6
                              mov bx,0
                              .if (column==0)&& (row<=2)
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx

                              .elseif (column==0)&& (row>2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                               call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                             
                              .elseif (column==1)&& (row<=2)
                              add i,27
                               call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,2
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx                             

                              .elseif (column==1)&& (row>2)
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,2
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx

                              .elseif (column==2)&& (row<=2)
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,4
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                             
                              .elseif (column==2)&& (row>2)
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,4
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx


                              .elseif (column==4)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,8
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                             
                              .elseif (column==4)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,8
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                              .elseif (column==5)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,10
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                              .elseif (column==5)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,10
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx
                              
                              .elseif (column==6)&& (row<=2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,12
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(7*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(14*2)],dx
                              .elseif (column==6)&& (row>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27

                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add square_y,27
                              call fillsquare_shapel3
                              add bx,12
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(28*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(35*2)],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+(42*2)],dx 
                              .endif
                              .endif
                           
                           call populatel3
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,3
                           mov cl,10
                             mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif
                     .endif
                  .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  .endif
                  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
HorizontalCrushl3 endp
VerticalCrush proc   


   mov counter,0
   ;mov score,0
    mov si,0
   .while si<8
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+(2*7)])
                     .if(ax==arr1[si+(2*14)])
                     .if(ax==arr1[si+(2*21)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+(2*14)],dx
                       call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+(2*21)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14||bx==21 ||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shape
                          ;add i,27
                          add square_y,27
                          call fillsquare_shape
                           ;add i,27
                           add square_y,27
                           call fillsquare_shape
                            add square_y,27
                           call fillsquare_shape
                            .if (arr1[si]==4)
                              .if (arr1[si+(2*7)]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*7)],dx
                                 .endif
                              .if (arr1[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*14)],dx
                              .endif
                               .if (arr1[si+(2*21)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*21)],dx
                              .endif
                              add score,4
                              call populatel1
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+12],dx                                                            
                            .elseif (arr1[si+(2*7)]==4)
                              .if (arr1[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*14)],dx
                              .endif
                               .if (arr1[si+(2*21)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*21)],dx
                              .endif
                              add score,4
                              call populatel1
                              add counter,7
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+12],dx                     
                            
                              .elseif (arr1[si+(2*14)]==4)
                               .if (arr1[si+(2*21)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*21)],dx
                              .endif
                              add score,4
                              call populatel1
                              add counter,14
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+12],dx    
                           .elseif (arr1[si+(2*21)]==4)
                           add score,4
                              call populatel1
                              add counter,21
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+12],dx                          
                              
                           .endif
                           call populatel1
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,4
                           mov cl,10
                             mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif

                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw
      mov counter,0
   mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+(2*7)])
                     .if(ax==arr1[si+(2*14)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr1[si+(2*14)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14||bx==21 ||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shape
                          ;add i,27
                          add square_y,27
                          call fillsquare_shape
                           ;add i,27
                           add square_y,27
                           call fillsquare_shape
                            .if (arr1[si]==4)
                              .if (arr1[si+(2*7)]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*7)],dx
                                 .endif
                              .if (arr1[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*14)],dx
                              .endif
                              add score,4
                              call populatel1
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+12],dx                                                            
                            .elseif (arr1[si+(2*7)]==4)
                              .if (arr1[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr1[si+(2*14)],dx
                              .endif
                              add score,4
                              call populatel1
                              add counter,7
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+12],dx                     
                            
                              .elseif (arr1[si+(2*14)]==4)
                              add score,4
                              call populatel1
                              add counter,14
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              add i,27
                              call fillsquare_shape
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr1[bx+12],dx                              
                              
                           .endif
                           call populatel1
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,3
                           mov cl,10
                            mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
VerticalCrush endp
VerticalCrushl2 proc   
 mov counter,0
   ;mov score,0
    mov si,0
   .while si<8
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+(2*7)])
                     .if(ax==arr2l2[si+(2*14)])
                     .if(ax==arr2l2[si+(2*21)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+(2*14)],dx
                       call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+(2*21)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14||bx==21 ||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel2
                          ;add i,27
                          add square_y,27
                          call fillsquare_shapel2
                           ;add i,27
                           add square_y,27
                           call fillsquare_shapel2
                            add square_y,27
                           call fillsquare_shapel2
                            .if (arr2l2[si]==4)
                              .if (arr2l2[si+(2*7)]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*7)],dx
                                 .endif
                              .if (arr2l2[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*14)],dx
                              .endif
                               .if (arr2l2[si+(2*21)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*21)],dx
                              .endif
                              add score,4
                              call populatel2
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bp,counter
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              .if (counter==0)||(counter==6)
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              .elseif (counter==1)||(counter==3)||(counter==5)
                               ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              .endif
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                              .if (bp==0)||(bp==6)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                             .elseif(bp==1)||(bp==3)||(bp==5)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay

                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+12],dx
                                  .endif                                                            
                            .elseif (arr2l2[si+(2*7)]==4)
                              .if (arr2l2[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*14)],dx
                              .endif
                               .if (arr2l2[si+(2*21)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*21)],dx
                              .endif
                              add score,4
                              call populatel2
                              add counter,7
                  
                               mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bp,counter
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              .if (counter==0)||(counter==6)
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              .elseif (counter==1)||(counter==3)||(counter==5)
                               ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              .endif
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                              .if (bp==0)||(bp==6)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                             .elseif(bp==1)||(bp==3)||(bp==5)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay

                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+12],dx
                                  .endif                        
                            
                              .elseif (arr2l2[si+(2*14)]==4)
                               .if (arr2l2[si+(2*21)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*21)],dx
                              .endif
                              add score,4
                              call populatel2
                              add counter,14
                  
                               mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bp,counter
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              .if (counter==0)||(counter==6)
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              .elseif (counter==1)||(counter==3)||(counter==5)
                               ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              .endif
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                              .if (bp==0)||(bp==6)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                             .elseif(bp==1)||(bp==3)||(bp==5)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay

                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+12],dx
                                  .endif       
                           .elseif (arr2l2[si+(2*21)]==4)
                              add score,4
                              call populatel2
                              add counter,21
                                mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bp,counter
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              .if (counter==0)||(counter==6)
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              .elseif (counter==1)||(counter==3)||(counter==5)
                               ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              .endif
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                              .if (bp==0)||(bp==6)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                             .elseif(bp==1)||(bp==3)||(bp==5)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay

                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+12],dx
                                  .endif                                                
                              
                           .endif
                           call populatel2
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,4
                           mov cl,10
                             mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw

   mov counter,0
   ;mov score,0
   

   mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+(2*7)])
                     .if(ax==arr2l2[si+(2*14)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr2l2[si+(2*14)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel2
                          ;add i,27
                          add square_y,27
                          call fillsquare_shapel2
                           ;add i,27
                           add square_y,27
                           call fillsquare_shapel2
                            .if (arr2l2[si]==4)
                              .if (arr2l2[si+(2*7)]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*7)],dx
                                 .endif
                              .if (arr2l2[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*14)],dx
                              .endif
                              add score,4
                              call populatel2
                  
                              mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bp,counter
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              .if (counter==0)||(counter==6)
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              .elseif (counter==1)||(counter==3)||(counter==5)
                               ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              .endif
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                              .if (bp==0)||(bp==6)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                             .elseif(bp==1)||(bp==3)||(bp==5)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay

                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+12],dx
                                  .endif                                                            
                            .elseif (arr2l2[si+(2*7)]==4)
                              .if (arr2l2[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr2l2[si+(2*14)],dx
                              .endif
                              add score,4
                              call populatel2
                              add counter,7
                  
                               mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bp,counter
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              .if (counter==0)||(counter==6)
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              .elseif (counter==1)||(counter==3)||(counter==5)
                               ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              .endif
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                              .if (bp==0)||(bp==6)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                             .elseif(bp==1)||(bp==3)||(bp==5)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay

                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+12],dx
                                  .endif                        
                            
                              .elseif (arr2l2[si+(2*14)]==4)
                              add score,4
                              call populatel2
                              add counter,14
                  
                               mov ax,counter
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov bp,counter
                              mov bx,counter
                              mov i,40
                              mov square_y,6
                              .while bx>0
                              add square_y,27
                              dec bx
                              .endw
                              .if (counter==0)||(counter==6)
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2
                              .elseif (counter==1)||(counter==3)||(counter==5)
                               ;call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              ;call fillsquare_shapel2

                              .else
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              add i,27
                              call fillsquare_shapel2
                              .endif
                              mov cx,counter
                              mov bx,0
                              ; mov bl,2
                              ; mul bl
                              ; mov counter,ax
                              ; mov bx,0
                              mov ax,14
                              .while cx>0
                              add bx,ax                              
                              dec cx
                              .endw
                              ;add bx,ax
                              .if (bp==0)||(bp==6)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                             .elseif(bp==1)||(bp==3)||(bp==5)
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay

                              .else
                                call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx],dx
                               call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+2],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+4],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+6],dx
                                   call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+8],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+10],dx
                                      call delay
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                  mov arr2l2[bx+12],dx
                                  .endif
                                  .endif
                           call populatel2
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,3
                           mov cl,10
                             mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                 ; inc counter
                  add di,2
                  mov si,temp
                  .endw
                ;  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
VerticalCrushl2 endp
VerticalCrushl3 proc   



   mov counter,0
   ;mov score,0
   

   mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .if(si!=6)
      .while di<14
      .if(di!=6)
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr3l3[si]
                  .if(ax==arr3l3[si+(2*7)])
                     .if(ax==arr3l3[si+(2*14)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr3l3[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr3l3[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,5
                      div  cx
                      mov arr3l3[si+(2*14)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax


                     ;   mov dx,counter
                     ;   add dx,48
                     ;   mov ah,02h
                     ;   int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<=7
                          sub i,27
                          .endif
                        ;   .if(bx==7)
                        ;   sub i,27
                        ;   .endif
                          call fillsquare_shapel3
                          ;add i,27
                          add square_y,27
                          call fillsquare_shapel3
                           ;add i,27
                           add square_y,27
                           call fillsquare_shapel3
                            .if (arr3l3[si]==4)
                              .if (arr3l3[si+(2*7)]==4)
                                call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[si+(2*7)],dx
                                 .endif
                              .if (arr3l3[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[si+(2*14)],dx
                              .endif
                              add score,4
                              call populatel3

                  
                              mov ax,counter
                              mov column,ax
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov row,ax
                              mov bx,column
                              .while bx>=7
                              sub bx,7
                              .endw
                              mov column,bx
                              mov i,40
                              mov square_y,6
                              mov bx,0
                              .if (row==0)&& (column<=2)
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx

                              .elseif (row==0)&& (column>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==1)&& (column<=2)
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,14
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0

                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx

                              .elseif (row==1)&& (column>2)
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,14
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==2)&& (column<=2)
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,28
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx
                              .elseif (row==2)&& (column>2)
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,28
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==4)&& (column<=2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,56
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==4)&& (column>2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,56
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .elseif (row==5)&& (column<=2)
                              add square_y,27
                               add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,70
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==5)&& (column>2)
                               add square_y,27
                                add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,70
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .elseif (row==6)&& (column<=2)
                              add square_y,27
                              add square_y,27
                               add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,84
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==6)&& (column>2)
                              add square_y,27
                               add square_y,27
                                add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,84
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .endif
                             
                                                                               
                            .elseif (arr3l3[si+(2*7)]==4)
                              .if (arr3l3[si+(2*14)]==4)
                               call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[si+(2*14)],dx
                              .endif
                              add score,4
                              call populatel3
                              add counter,7
                              mov ax,counter
                              mov column,ax
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov row,ax
                              mov bx,column
                              .while bx>=7
                              sub bx,7
                              .endw
                              mov column,bx
                              mov i,40
                              mov square_y,6
                              mov bx,0
                              .if (row==0)&& (column<=2)
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx

                              .elseif (row==0)&& (column>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==1)&& (column<=2)
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,14
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                 
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx

                              .elseif (row==1)&& (column>2)
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,14
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==2)&& (column<=2)
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,28
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx
                              .elseif (row==2)&& (column>2)
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,28
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==4)&& (column<=2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,56
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==4)&& (column>2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,56
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .elseif (row==5)&& (column<=2)
                              add square_y,27
                               add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,70
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==5)&& (column>2)
                               add square_y,27
                                add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,70
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .elseif (row==6)&& (column<=2)
                              add square_y,27
                              add square_y,27
                               add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,84
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==6)&& (column>2)
                              add square_y,27
                               add square_y,27
                                add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,84
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .endif                 
                            
                              .elseif (arr3l3[si+(2*14)]==4)
                              add score,4
                              call populatel3
                              add counter,14
                               mov ax,counter
                              mov column,ax
                              mov bl,7
                              div bl
                              mov ah,0
                              mov counter,ax
                              mov row,ax
                              mov bx,column
                              .while bx>=7
                              sub bx,7
                              .endw
                              mov column,bx
                              mov i,40
                              mov square_y,6
                              mov bx,0
                              .if (row==0)&& (column<=2)
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx

                              .elseif (row==0)&& (column>2)
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                               MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==1)&& (column<=2)
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,14
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                 
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx

                              .elseif (row==1)&& (column>2)
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,14
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==2)&& (column<=2)
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,28
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+2],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+4],dx
                              .elseif (row==2)&& (column>2)
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,28
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+8],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+10],dx
                                  call delay
                                MOV  AH, 00h          ; interrupts to get system time
                                INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                 mov  ax,dx
                                 mov  dx,0
                                    mov  cx,4
                                 div  cx
                                 mov arr3l3[bx+12],dx
                              .elseif (row==4)&& (column<=2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,56
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==4)&& (column>2)
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,56
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .elseif (row==5)&& (column<=2)
                              add square_y,27
                               add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,70
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==5)&& (column>2)
                               add square_y,27
                                add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,70
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .elseif (row==6)&& (column<=2)
                              add square_y,27
                              add square_y,27
                               add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,84
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+2],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+4],dx
                              .elseif (row==6)&& (column>2)
                              add square_y,27
                               add square_y,27
                                add square_y,27
                              add square_y,27
                              add square_y,27
                              add square_y,27
                              add i,27
                              add i,27
                              add i,27
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add i,27
                              call fillsquare_shapel3
                              add bx,84
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+8],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+10],dx
                                    call delay
                                 MOV  AH, 00h          ; interrupts to get system time
                                 INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                                  mov  ax,dx
                                  mov  dx,0
                                       mov  cx,4
                                  div  cx
                                  mov arr3l3[bx+12],dx
                              .endif
                              
                  
                             
                                  .endif
                           call populatel3
                           .if l2count!=0
                           mov ah,02h
                           mov bh,0
                           mov dh,10
                           mov dl,32
                           int 10h
                           add score,3
                           mov cl,10
                             mov al,score
                           mov ah,0
                           div cl
                           mov bl,al
                           mov bh,ah
                           mov ah,0
                           mov al,bl
                           mov cl,10
                           div cl
                           mov bl,ah
                           mov dl,al
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bl
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,bh
                           add dl,48
                           mov ah,02h
                           int 21h
                           .endif
                     .endif
                  .endif
                  .endif
                  ;call board function
                  ;add bonus
                 ; inc counter
                  add di,2
                  mov si,temp
                  .endw
                  .endif
                  ;dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
VerticalCrushl3 endp
checkcrush proc
   
 mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+(2*7)])
                     .if(ax==arr1[si+(2*14)])
                     inc checkcount
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+(2*7)],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+(2*14)],dx
                      .endif
                  .endif
                  ;call board function
                  ;add bonus
                 ; inc counter
                  add di,2
                  mov si,temp
                  .endw
                 ; dec counter
                  add si,2
                  .endw

   ;mov score,0
   

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<10
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+2])
                     .if(ax==arr1[si+4])
                     inc checkcount
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+2],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+4],dx
                       .endif
                  .endif
                  ;call board function
                  ;add bonus
                  ;inc counter
                  add di,2
                  mov si,temp
                  .endw
                 ; dec counter
                  add si,2
                  .endw



   ret
checkcrush endp
checkcrushl2 proc
   
 mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+(2*7)])
                     .if(ax==arr2l2[si+(2*14)])
                     inc checkcount
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+(2*7)],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+(2*14)],dx
                      .endif
                  .endif
                  ;call board function
                  ;add bonus
                 ; inc counter
                  add di,2
                  mov si,temp
                  .endw
                 ; dec counter
                  add si,2
                  .endw

   ;mov score,0
   

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<10
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+2])
                     .if(ax==arr2l2[si+4])
                     inc checkcount
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+2],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+4],dx
                       .endif
                  .endif
                  ;call board function
                  ;add bonus
                  ;inc counter
                  add di,2
                  mov si,temp
                  .endw
                 ; dec counter
                  add si,2
                  .endw



   ret
checkcrushl2 endp
checkcrushl3 proc
 mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .if(si!=6)
      .while di<14
      .if(di!=6)
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr3l3[si]
                  .if(ax==arr3l3[si+(2*7)])
                     .if(ax==arr3l3[si+(2*14)])
                     inc checkcount
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+(2*7)],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+(2*14)],dx
                      .endif
                  .endif
                  .endif
                  ;call board function
                  ;add bonus
                 ; inc counter
                  add di,2
                  mov si,temp
                  .endw
                  .endif
                 ; dec counter
                  add si,2
                  .endw

   ;mov score,0
   

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .if(si!=6)
      .while di<10
      .if(di!=6)
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr3l3[si]
                  .if(ax==arr3l3[si+2])
                     .if(ax==arr3l3[si+4])
                     inc checkcount
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+2],dx
                     ;  call delay
                     ;  MOV  AH, 00h          ; interrupts to get system time
                     ;  INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                     ;  mov  ax,dx
                     ;  mov  dx,0
                     ;  mov  cx,5
                     ;  div  cx
                     ;  mov arr1[si+4],dx
                       .endif
                  .endif
                  ;call board function
                  ;add bonus
                  ;inc counter
                  .endif
                  add di,2
                  mov si,temp
                  .endw
                  .endif
                 ; dec counter
                  add si,2
                  .endw



   ret
checkcrushl3 endp
checkHorizontalCrush proc   


   mov counter,0
   ;mov score,0
    mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<8
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+2])
                     .if(ax==arr1[si+4])
                     .if(ax==arr1[si+6])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+4],dx
                       call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+6],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shape
                          add i,27
                          call fillsquare_shape
                           add i,27
                           call fillsquare_shape
                           add i,27
                           call fillsquare_shape
                           call populatel1
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                ;  inc counter
                  add di,2
                  mov si,temp
                  .endw
                 ; dec counter
                  add si,2
                  .endw
                 ; mov checkcount,0
    mov counter,0

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<10
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+2])
                     .if(ax==arr1[si+4])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+4],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shape
                          add i,27
                          call fillsquare_shape
                           add i,27
                           call fillsquare_shape
                           call populatel1
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
checkHorizontalCrush endp
checkHorizontalCrushl2 proc   
 mov counter,0
   ;mov score,0
    mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<8
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+2])
                     .if(ax==arr2l2[si+4])
                     .if(ax==arr2l2[si+6])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+4],dx
                       call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+6],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel2
                          add i,27
                          call fillsquare_shapel2
                           add i,27
                           call fillsquare_shapel2
                           add i,27
                           call fillsquare_shapel2
                           call populatel2
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  ;inc counter
                  add di,2
                  mov si,temp
                  .endw
                ;  dec counter
                  add si,2
                  .endw


   mov counter,0
   ;mov score,0
   

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .while di<10
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+2])
                     .if(ax==arr2l2[si+4])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+4],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel2
                          add i,27
                          call fillsquare_shapel2
                           add i,27
                           call fillsquare_shapel2
                           call populatel2
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
               ;   inc counter
                  add di,2
                  mov si,temp
                  .endw
                ;  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
checkHorizontalCrushl2 endp
checkHorizontalCrushl3 proc   


   mov counter,0
   ;mov score,0
   

   mov si,0
   .while si<14
      mov di,0
      ;mov counter,0
      .if(si!=6)
      .while di<10
      .if(di!=6)
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr3l3[si]
                  .if(ax==arr3l3[si+2])
                     .if(ax==arr3l3[si+4])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr3l3[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr3l3[si+2],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr3l3[si+4],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel3
                          add i,27
                          call fillsquare_shapel3
                           add i,27
                           call fillsquare_shapel3
                           call populatel3
                     .endif
                  .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  .endif
                  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
checkHorizontalCrushl3 endp
checkVerticalCrush proc   


   mov counter,0
   ;mov score,0
    mov si,0
   .while si<8
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+(2*7)])
                     .if(ax==arr1[si+(2*14)])
                     .if(ax==arr1[si+(2*21)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+(2*14)],dx
                       call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+(2*21)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14||bx==21 ||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shape
                          ;add i,27
                          add square_y,27
                          call fillsquare_shape
                           ;add i,27
                           add square_y,27
                           call fillsquare_shape
                            add square_y,27
                           call fillsquare_shape
                           call populatel1
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw
      mov counter,0
   mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr1[si]
                  .if(ax==arr1[si+(2*7)])
                     .if(ax==arr1[si+(2*14)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr1[si+(2*14)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14||bx==21 ||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shape
                          ;add i,27
                          add square_y,27
                          call fillsquare_shape
                           ;add i,27
                           add square_y,27
                           call fillsquare_shape
                           call populatel1
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
checkVerticalCrush endp
checkVerticalCrushl2 proc   
 mov counter,0
   ;mov score,0
    mov si,0
   .while si<8
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+(2*7)])
                     .if(ax==arr2l2[si+(2*14)])
                     .if(ax==arr2l2[si+(2*21)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+(2*14)],dx
                       call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+(2*21)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14||bx==21 ||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel2
                          ;add i,27
                          add square_y,27
                          call fillsquare_shapel2
                           ;add i,27
                           add square_y,27
                           call fillsquare_shapel2
                            add square_y,27
                           call fillsquare_shapel2
                           call populatel2
                           .endif
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw

   mov counter,0
   ;mov score,0
   

   mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .while di<14
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr2l2[si]
                  .if(ax==arr2l2[si+(2*7)])
                     .if(ax==arr2l2[si+(2*14)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr2l2[si+(2*14)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14 ||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<7
                          sub i,27
                          .endif
                          call fillsquare_shapel2
                          ;add i,27
                          add square_y,27
                          call fillsquare_shapel2
                           ;add i,27
                           add square_y,27
                           call fillsquare_shapel2
                           call populatel2
                     .endif
                  .endif
                  ;call board function
                  ;add bonus
                  inc counter
                  add di,2
                  mov si,temp
                  .endw
                  dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
checkVerticalCrushl2 endp
checkVerticalCrushl3 proc   


   mov counter,0
   ;mov score,0
   

   mov si,0
   .while si<10
      mov di,0
      ;mov counter,0
      .if(si!=6)
      .while di<14
      .if(di!=6)
         mov ax,si
         mov bx,7
         mul bx
         add ax,di
         mov counter,ax
         mov temp,si
         mov si,ax
      ;      .if level_1==1
               mov ax,arr3l3[si]
                  .if(ax==arr3l3[si+(2*7)])
                     .if(ax==arr3l3[si+(2*14)])
                     ; mov dx,'H'
                     ; mov ah,02h
                     ; int 21h
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr3l3[si],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr3l3[si+(2*7)],dx
                      call delay
                      MOV  AH, 00h          ; interrupts to get system time
                      INT  1AH              ; CX:DX now hold number of clock ticks since midnight
                      mov  ax,dx
                      mov  dx,0
                      mov  cx,4
                      div  cx
                      mov arr3l3[si+(2*14)],dx
                     ;  mov dx,counter
                     ;  add dx,48
                     ;    mov ah,02h
                     ;    int 21h
                     ;  mov dx,counter
                     ;  add dx,48
                     ;  mov ah,02h
                     ;  int 21h
                     mov dx,0
                     mov cx,2
                     mov ax,counter
                     div cx
                     mov counter,ax


                     ;   mov dx,counter
                     ;   add dx,48
                     ;   mov ah,02h
                     ;   int 21h

                      mov bx,0
                      mov i,40
                      mov square_y,6
                      .while bx<=counter
                        add i,27
                        .if (bx==7||bx==14||bx==21||bx==28||bx==35||bx==42)
                          mov i,40
                          add square_y,27
                          .endif
                          inc bx
                          .endw
                          .if bx<=7
                          sub i,27
                          .endif
                        ;   .if(bx==7)
                        ;   sub i,27
                        ;   .endif
                          call fillsquare_shapel3
                          ;add i,27
                          add square_y,27
                          call fillsquare_shapel3
                           ;add i,27
                           add square_y,27
                           call fillsquare_shapel3
                           call populatel3
                     .endif
                  .endif
                  .endif
                  ;call board function
                  ;add bonus
                 ; inc counter
                  add di,2
                  mov si,temp
                  .endw
                  .endif
                  ;dec counter
                  add si,2
                  .endw
                  mov checkcount,0

                     
   ret
checkVerticalCrushl3 endp
showMouse proc
	push ax
		mov ax,1
		int 33h	
	pop ax
   ret
showMouse endp
HideMouse proc
	push ax
		mov ax,2
		int 33h
	pop ax
   ret
HideMouse endp
playgamel1 proc
   mov moves,10
   .while(moves>0)
    mov ah,02h
   mov bh,0
   mov dh,15
   mov dl,32
                           int 10h
                           mov cl,10
                           mov al,moves
                           mov ah,0
                           div cl
                           mov dl,al
                           mov cl,ah
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,cl
                           add dl,48
                           mov ah,02h
                           int 21h

   mov checkcount,1
   mov cx,0
   ;call GetButtonPressedInfo
   ;call GetButtonPressedInfo
   mov bx,0
   call showMouse
   .while(bx!=1)
   call GetMouseCurrentPos
   .if bx==1
   call checkleftclick
   mov bx,1
   .endif
   .endw
   mov prevbox,ax
   call delay
   call delay
   call delay
   call delay
   call delay
   ; call delay
   ; call delay
  ; call delay
   ;call delay
   ; call delay
   ; call delay
   ; call delay

   mov bx,0
   .while(bx!=1)
   call GetMouseCurrentPos
   .if bx==1
   call checkleftclick
   mov bx,1
   .endif
   .endw
   call HideMouse
   mov currbox,ax
   mov cx,prevbox
   .if(cx>currbox)
   mov ax,prevbox
   sub ax,currbox
   .else
   mov ax,currbox
   sub ax,prevbox
   .endif
   .if (ax==1)||(ax==7)
   call swap
   call delay
   call delay
   call delay
   call delay
    call delay
   ; call delay
   ; ;call delay
   ; call delay
   ; call delay
   ; call delay
   mov i,40
   mov square_y,6
   mov cx,currbox
   mov bx,0
   mov ax,0
   .while bx<=cx
   add i,27
   .if ax==7
   mov i,40
   add square_y,27
   mov ax,0
   .endif
   inc ax
   inc bx
   .endw
   .if bx<=7
   sub i,27
   .endif
  ; add i,27
   call fillsquare_shape
   mov i,40
   mov square_y,6
   mov cx,prevbox
   mov bx,0
   mov ax,0
   .while bx<=cx
   add i,27
   .if ax==7
   mov i,40
   add square_y,27
   mov ax,0
   .endif
   inc ax
   inc bx
   .endw
   .if bx<=7
   sub i,27
   .endif
   call fillsquare_shape
   call populatel1
   .while checkcount!=0
   call HorizontalCrush
   call VerticalCrush 
   call checkcrush
   .endw

   dec moves
   .endif  
   .if(score>=50)
   MOV  AH, 06h                  ; Scroll up function
               XOR  AL, AL                   ; Clear entire screen
               XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
               MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
               MOV  BH, 00h                
               INT  10H
                mov ah,02h
   mov bh,0
   mov dh,10
   mov dl,1
                           int 10h
                              mov dx,offset congrats
               mov ah,09h
               int 21h
               mov ah,02h
   mov bh,0
   mov dh,15
   mov dl,9
                           int 10h
                           mov dx,offset press
                           mov ah,09h
                           int 21h

   mov l1count,0
   mov l2count,0
   ret
   .endif
   .endw
   .if(moves==0)
    MOV  AH, 06h                  ; Scroll up function
               XOR  AL, AL                   ; Clear entire screen
               XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
               MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
               MOV  BH, 00h                
               INT  10H
                mov ah,02h
   mov bh,0
   mov dh,10
   mov dl,5
                           int 10h

               mov dx,offset gameover
               mov ah,09h
               int 21h
               mov ah,4ch
               int 21h


   .endif
   mov l1count,0
   mov l2count,0
   ret
playgamel1 endp
playgamel2 proc  
   mov score,0
   mov moves,10
.while(moves>0)
 mov ah,02h
   mov bh,0
   mov dh,15
   mov dl,32
                           int 10h
                           mov cl,10
                           mov al,moves
                           mov ah,0
                           div cl
                           mov dl,al
                           mov cl,ah
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,cl
                           add dl,48
                           mov ah,02h
                           int 21h
   mov checkcount,1
   mov cx,0
   ;call GetButtonPressedInfo
   ;call GetButtonPressedInfo
   mov bx,0
  call showMouse
   .while(bx!=1)
   call GetMouseCurrentPos
   .if bx==1
   call checkleftclick
   mov bx,1
   .endif
   .endw
   mov prevbox,ax
   call delay
   call delay
   call delay
   call delay
   call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay

   mov bx,0
   .while(bx!=1)
   call GetMouseCurrentPos
   .if bx==1
   call checkleftclick
   mov bx,1
   .endif
   .endw
   call HideMouse
   mov currbox,ax
   mov cx,prevbox
   .if(cx>currbox)
   mov ax,prevbox
   sub ax,currbox
   .else
   mov ax,currbox
   sub ax,prevbox
   .endif
   .if (ax==1)||(ax==7)
   call swapl2
   call delay
   call delay
   call delay
   call delay
   call delay
   ;call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   mov i,40
   mov square_y,6
   mov cx,currbox
   mov bx,0
   mov ax,0
   .while bx<=cx
   add i,27
   .if ax==7
   mov i,40
   add square_y,27
   mov ax,0
   .endif
   inc ax
   inc bx
   .endw
   .if bx<=7
   sub i,27
   .endif
  ; add i,27
   call fillsquare_shapel2
   mov i,40
   mov square_y,6
   mov cx,prevbox
   mov bx,0
   mov ax,0
   .while bx<=cx
   add i,27
   .if ax==7
   mov i,40
   add square_y,27
   mov ax,0
   .endif
   inc ax
   inc bx
   .endw
   .if bx<=7
   sub i,27
   .endif
   call fillsquare_shapel2
   call populatel2
   .while checkcount!=0
   call HorizontalCrushl2
   call VerticalCrushl2 
   call checkcrushl2
;    mov bh,0
; mov dh,15
; mov dl,10
; mov ah,02h
; int 10h

; mov si,offset arr2l2
; mov bx,0
; .while bx<49
; mov dx,[si]
; add dx,48
; mov ah,02
; int 21h
; inc bx
; add si,2
; .endw    
   .endw
   dec moves
   .endif
   .if(score>=60)
   MOV  AH, 06h                  ; Scroll up function
               XOR  AL, AL                   ; Clear entire screen
               XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
               MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
               MOV  BH, 00h                
               INT  10H
                mov ah,02h
   mov bh,0
   mov dh,10
   mov dl,1
                           int 10h
                              mov dx,offset congrats2
               mov ah,09h
               int 21h
               mov ah,02h
   mov bh,0
   mov dh,15
   mov dl,9
                           int 10h
                           mov dx,offset press
                           mov ah,09h
                           int 21h

   mov l1count,0
   mov l2count,0
   ret
   .endif
   .endw
   .if(moves==0)
    MOV  AH, 06h                  ; Scroll up function
               XOR  AL, AL                   ; Clear entire screen
               XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
               MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
               MOV  BH, 00h                
               INT  10H
                mov ah,02h
   mov bh,0
   mov dh,10
   mov dl,5
                           int 10h

               mov dx,offset gameover
               mov ah,09h
               int 21h
               mov ah,4ch
               int 21h


   .endif
mov l1count,0
mov l2count,0



   ret
playgamel2 endp
playgamel3 proc  
   mov score,0
   mov moves,10
.while(moves>0)
 mov ah,02h
   mov bh,0
   mov dh,15
   mov dl,32
                           int 10h
                           mov cl,10
                           mov al,moves
                           mov ah,0
                           div cl
                           mov dl,al
                           mov cl,ah
                           ;mov dx,0
                         ;  mov dl,score
                           add dl,48
                           mov ah,02h
                           int 21h
                           mov dl,cl
                           add dl,48
                           mov ah,02h
                           int 21h
   mov checkcount,1
   mov cx,0
   ;call GetButtonPressedInfo
   ;call GetButtonPressedInfo
   mov bx,0
  call showMouse
   .while(bx!=1)
   call GetMouseCurrentPos
   .if bx==1
   call checkleftclick
   mov bx,1
   .endif
   .endw
   mov prevbox,ax
   call delay
   call delay
   call delay
   call delay
   call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay

   mov bx,0
   .while(bx!=1)
   call GetMouseCurrentPos
   .if bx==1
   call checkleftclick
   mov bx,1
   .endif
   .endw
   call HideMouse
   mov currbox,ax
   mov cx,prevbox
   .if(cx>currbox)
   mov ax,prevbox
   sub ax,currbox
   .else
   mov ax,currbox
   sub ax,prevbox
   .endif
   .if (ax==1)||(ax==7)
   call swapl3
   call delay
   call delay
   call delay
   call delay
   call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   ; call delay
   mov i,40
   mov square_y,6
   mov cx,currbox
   mov bx,0
   mov ax,0
   .while bx<=cx
   add i,27
   .if ax==7
   mov i,40
   add square_y,27
   mov ax,0
   .endif
   inc ax
   inc bx
   .endw
   .if bx<=7
   sub i,27
   .endif
  ; add i,27
   call fillsquare_shapel3
   mov i,40
   mov square_y,6
   mov cx,prevbox
   mov bx,0
   mov ax,0
   .while bx<=cx
   add i,27
   .if ax==7
   mov i,40
   add square_y,27
   mov ax,0
   .endif
   inc ax
   inc bx
   .endw
   .if bx<=7
   sub i,27
   .endif
   call fillsquare_shapel3
   call populatel3
   .while checkcount!=0
   call HorizontalCrushl3
   call VerticalCrushl3
   call checkcrushl3  
   .endw
   dec moves
   .endif
   .if(score>=70)
   MOV  AH, 06h                  ; Scroll up function
               XOR  AL, AL                   ; Clear entire screen
               XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
               MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
               MOV  BH, 00h                
               INT  10H
                mov ah,02h
   mov bh,0
   mov dh,10
   mov dl,1
                           int 10h
                              mov dx,offset congrats3
               mov ah,09h
               int 21h
               mov ah,02h
   mov bh,0
   mov dh,15
   mov dl,9
                           int 10h
                           mov dx,offset press
                           mov ah,09h
                           int 21h

   mov l1count,0
   mov l2count,0
   ret
   .endif
   .endw
   .if(moves==0)
    MOV  AH, 06h                  ; Scroll up function
               XOR  AL, AL                   ; Clear entire screen
               XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
               MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
               MOV  BH, 00h                
               INT  10H
                mov ah,02h
   mov bh,0
   mov dh,10
   mov dl,5
                           int 10h

               mov dx,offset gameover
               mov ah,09h
               int 21h
               mov ah,4ch
               int 21h


   .endif




   ret
playgamel3 endp

write proc


mov ah,3ch
lea dx,filewrite
mov cl,0
int 21h
mov fhandle,ax


mov ah,3eh
mov bx,fhandle
int 21h

mov ah,3dh
mov al,2
lea dx, filewrite
int 21h
mov fhandle,ax

mov ah,2
mov bx,fhandle
xor cx,cx
xor dx,cx
mov al,2
int 21h


;writing the name of the player 
mov cx,7 ;number of bytes
mov bx,fhandle
lea dx,namestr
mov ah,40h
int 21h

;;;;;;;name

mov cx,8
mov si,0

name1:
mov dl,playername[si]
.if(dl=='$')
   jmp chk
   .endif
   inc si
loop name1
chk:

mov cx,SI
mov bx,fhandle
lea dx,playername
mov ah,40h
int 21h

mov cx,1
mov bx,fhandle
lea dx,newlines
mov ah,40h
int 21h

mov cx,sizeof level1str
dec cx




mov bx,fhandle
lea dx,level1str
mov ah,40h
int 21h

mov al,level1score
mov ah,0
mov bl,10
div bl
mov var0,ah
add var0,48
mov ah,0
div bl
mov var1,ah
add var1,48
mov ah,0
div bl
mov var2,ah
add var2,48

mov cx,1
mov bx,fhandle
lea dx,var2
mov ah,40h
int 21h
mov cx,1
mov bx,fhandle
lea dx,var1
mov ah,40h
int 21h
mov cx,1
mov bx,fhandle
lea dx,var0
mov ah,40h
int 21h

mov cx,1
mov bx,fhandle
lea dx,newlines
mov ah,40h
int 21h

mov cx,sizeof level2str
dec cx
mov bx,fhandle
lea dx,level2str
mov ah,40h
int 21h

mov al,level2score
mov ah,0
mov bl,10
div bl
mov var0,ah
add var0,48
mov ah,0
div bl
mov var1,ah
add var1,48
mov ah,0
div bl
mov var2,ah
add var2,48

mov cx,1
mov bx,fhandle
lea dx,var2
mov ah,40h
int 21h
mov cx,1
mov bx,fhandle
lea dx,var1
mov ah,40h
int 21h
mov cx,1
mov bx,fhandle
lea dx,var0
mov ah,40h
int 21h

mov cx,1
mov bx,fhandle
lea dx,newlines
mov ah,40h
int 21h

mov cx,sizeof level3str
dec cx
mov bx,fhandle
lea dx,level3str
mov ah,40h
int 21h

mov al,level3score
mov ah,0
mov bl,10
div bl
mov var0,ah
add var0,48
mov ah,0
div bl
mov var1,ah
add var1,48
mov ah,0
div bl
mov var2,ah
add var2,48

mov cx,1
mov bx,fhandle
lea dx,var2
mov ah,40h
int 21h
mov cx,1
mov bx,fhandle
lea dx,var1
mov ah,40h
int 21h
mov cx,1
mov bx,fhandle
lea dx,var0
mov ah,40h
int 21h

mov cx,1
mov bx,fhandle
lea dx,newlines
mov ah,40h
int 21h

mov cx,sizeof highscorestring
dec cx
mov bx,fhandle
lea dx,highscorestring
mov ah,40h
int 21h

mov al,level1score
cmp al,level2score
jae here1
mov al,level2score
mov highest, al
mov al,highest
jmp here2
here1:
mov highest,al

here2:

cmp al,level3score
jae here3
mov al,level3score
mov highest, al
jmp here4
here3:
mov highest,al
here4:


mov al,highest
mov ah,0
mov bl,10
div bl
mov var0,ah
add var0,48
mov ah,0
div bl
mov var1,ah
add var1,48
mov ah,0
div bl
mov var2,ah
add var2,48

mov cx,1
mov bx,fhandle
lea dx,var2
mov ah,40h
int 21h
mov cx,1
mov bx,fhandle
lea dx,var1
mov ah,40h
int 21h
mov cx,1
mov bx,fhandle
lea dx,var0
mov ah,40h
int 21h

    ; Close file
    mov ah, 3eh           ; DOS function for closing file
    mov bx, fhandle       ; File handle
    int 21h               ; Call DOS interrupt

    ret                   ; Return from procedure

write endp


instructions proc
  MOV  AH, 06h                  ; Scroll up function
      XOR  AL, AL                   ; Clear entire screen
      XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
      MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
      MOV  BH, 00h                 ; red color on screen
      INT  10H
            mov  ah,02h
               mov  bh,00h
               mov  dh,0
               mov  dl,8
               int  10h

               mov ah, 09h
               mov dx, offset ins0
               int 21h

               mov  ah,02h
               mov  bh,00h
               mov  dh,1
               mov  dl,0
               int  10h

               mov ah, 09h
               mov dx, offset ins1
               int 21h

               mov  ah,02h
               mov  bh,00h
               mov  dh,3
               mov  dl,0
               int  10h

               mov ah, 09h
               mov dx, offset ins2
               int 21h

               mov  ah,02h
               mov  bh,00h
               mov  dh,6
               mov  dl,0
               int  10h

               mov ah, 09h
               mov dx, offset ins3
               int 21h

              
               mov  ah,02h
               mov  bh,00h
               mov  dh,8
               mov  dl,0
               int  10h

               mov ah, 09h
               mov dx, offset ins4
               int 21h

               mov  ah,02h
               mov  bh,00h
               mov  dh,11
               mov  dl,0
               int  10h

               mov ah, 09h
               mov dx, offset ins5
               int 21h

               mov  ah,02h
               mov  bh,00h
               mov  dh,14
               mov  dl,0
               int  10h

               mov ah, 09h
               mov dx, offset ins6
               int 21h

               mov  ah,02h
               mov  bh,00h
               mov  dh,17
               mov  dl,0
               int  10h

               mov ah, 09h
               mov dx, offset ins7
               int 21h

                mov  ah,02h
               mov  bh,00h
               mov  dh,22
               mov  dl,0
               int  10h

               mov ah, 09h
               mov dx, offset ins8
               int 21h

               mov ah,02h

                mov  bh,00h
               mov  dh,24
               mov  dl,8
               int  10h
               mov dx, offset ins9
               mov ah,09h
               int 21h

               mov ah,01h
               int 21h


   ret
instructions endp


main proc
               mov  ax,@data
               mov  ds,ax
               mov  ah,00h
               mov  al,013h
               int 10h


               mov  ah,02h
               mov  bh,00h
               mov  dh,8
               mov  dl,8
               int  10h



               mov  ah, 09h
               mov  dx, offset welcome
               int  21h
               mov  ah,02h
               mov  bh,00h
               mov  dh,10
               mov  dl,5
               int  10h
               mov  ah, 09h
               mov  dx, offset nam
               int  21h
               mov  ah,02h
               mov  bh,00h
               mov  dh,12
               mov  dl,5
               int  10h
               mov  ah, 09h
               mov  dx, offset arr2
               int  21h
               mov  si, offset playername
               mov  cx,0

               
    inputname: 
               mov  ah, 01h
               int  21h
               inc  cx
               cmp  cx, 9
               je   tocode
               mov  [si], al
               inc  si
               cmp  al, 0dh
               jne  inputname

    tocode:

               call instructions

               MOV  AH, 06h                  ; Scroll up function
               XOR  AL, AL                   ; Clear entire screen
               XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
               MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
               MOV  BH, 00h                 
               INT  10H
               

      
               mov si,0

               call backsquare
                     
               call level_1
               call populatel1
               call setmouserange

               ;call square_shape
              ; call write
               mov si,0 
               call playgamel1
               call HideMouse
               mov ah,score
               mov level1score,ah
               call write
               mov ax,0
               mov si,0

               mov  ah,01h
               int  21h

               MOV  AH, 06h                  ; Scroll up function
               XOR  AL, AL                   ; Clear entire screen
               XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
               MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
               MOV  BH, 00h                
               INT  10H


               call backsquare
               call level_2
               call populatel2

               ;call setmouserange
              ; call setmouserange
              call showMouse
               call playgamel2
               call HideMouse
                mov ah,score
               mov level2score,ah
               call write
               mov ax,0
               mov si,0
               mov  ah,01h
               int  21h


      MOV  AH, 06h                  ; Scroll up function
      XOR  AL, AL                   ; Clear entire screen
      XOR  CX, CX                   ; Upper left corner CH=upper row, CL= upper column
      MOV  DX, 184fH                ; lower right corner DH=lower row, DL= lower column ;0 to 24 rows and 0 to 79 columns
      MOV  BH, 00h                 
      INT  10H

      call backsquare

      call level_3
        call populatel3
        ;call setmouserange
        call showMouse
        call playgamel3
         mov ah,score
               mov level3score,ah
               call write
;call setmouserange
               mov  ah,01
               int  21h






               mov  ah,04ch
               int  21h




main endp
end main