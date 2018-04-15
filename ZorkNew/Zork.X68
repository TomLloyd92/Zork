    org $1000

*Created By:     Tom Lloyd
*Student Number: c00231308
*
*
*
*-------------------------------------------------------
*Choose to be Evil Wizard or New Romancers
*-------------------------------------------------------

*-------------------------------------------------------
*Validation values to be used, modify as needed
*Add additional validation values as required
*-------------------------------------------------------
exit        EQU 0      used to exit assembly program
min_feed    EQU 100    min feed requirement
min_horses  EQU 1      min number of horses
max_horses  EQU 9      max number of horses
min_soldier EQU 6      min soldiers
min_charge  EQU 1      min rate of fuel use based of speed (oats for horses)
max_charge  EQU 5      max rate e.g. Flank       
hit_point   EQU 5      points accumilated on castle (objective) strike
miss_point  EQU 8      points deducted for ordinace miss

mine_loc    EQU 100    example for a hit


*Start of Game
start:
    move.b  #100,$4000 put score/health in memory location $4000
    lea     $4000,A3   assign address A3 to that memory location    
    
    bsr     NEWGAME    Branch to new game   
    
    bsr     welcome    branch to the welcome subroutine 
    bsr     input      branch to the input subroutine 
    bsr     game       branch to the game subroutine
*Game loop
    org     $3000      the rest of the program is to be located from 3000 onwards


 *-----------------------------------------*
 *-----------GAME STARTS HERE--------------*
 *-----------------------------------------*


NEWGAME
   
    ADD.l     #1000,A4              Current Feed
    
   
    LEA     Opening_msg,A1          Load beginning Message Introducing the player to the game
    MOVE.B  #14,D0                  Load beginning Message  
    TRAP    #15                     Display beginning Message     
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Unput number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     OgBeginning             If 1 was selected branch to Og beginning
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     TBBeginning             If 2 was input branch to TB beginning

    CMP.B   #1,D1                   Compears D1 to 1
    BLT     INVALID                 If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                   Compears the number to 2
    BGT     INVALID                 Branches to Invalid
            

INVALID LEA     INV,A1              Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     NEWGAME             Branch to Start
        
INVALIDOG1 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OgBeginning         
        
INVALIDOG2 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OgSideEntrance      
        
INVALIDOG3 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OgMainGate     
        
INVALIDOG4 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OgThroneRoom    
        
INVALIDOG5 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OGSoldiers        
        
INVALIDOG6 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OgHeavyAttack             
        
INVALIDOG7 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OgFastAttack            

INVALIDOG8 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OgSpare     

INVALIDOG9 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     OgKill   
        
INVALIDTB1 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBBeginning
        
INVALIDTB2 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBFront
        
INVALIDTB3 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBBack        

INVALIDTB4 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBStartFire
        
INVALIDTB5 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBConfront
        
INVALIDTB6 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBRetreat

INVALIDTB7 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBThrone
        
INVALIDTB8 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBHeavy
 
INVALIDTB9 LEA     INV,A1           Put Invalid into A1
        MOVE.B  #14,D0              14 into D0
        TRAP    #15                 Trap 15 Display the message in A1
        BRA     TBSmall




*-------------------------------------------------------
*-------------------Game Subroutine---------------------
*-------------------------------------------------------
game:
    bsr     gameloop   branch to gameloop subroutine
    rts                return from game: subroutine
          
end:
    simhalt

*-------------------------------------------------------
*-------------------Welcome Subroutine------------------
*-------------------------------------------------------
welcome:
    bsr     endl            branch to endl subroutine
    lea     welcome_msg,A1  assign message to address register A1
    move.b  #14,D0          move literal 14 to DO
    trap    #15             trap and interpret value in D0
    bsr     endl            branch to endl subroutine
    rts                     return from welcome: subroutine

*-------------------------------------------------------
*---------Gameplay Input Values Subroutine--------------
*-------------------------------------------------------    
input:
    bsr     feed            branch to feed input subroutine
    bsr     horses          branch to ship input subroutine
    bsr     rate            branch to rate (charging speed) input subroutine
    bsr     distance        branch to mission distance/location input subroutine
    bsr     soldiers        branch to soldiers input subroutine
    rts

*-------------------------------------------------------
*----------------Gameloop (main loop)-------------------
*------------------------------------------------------- 
gameloop:
    bsr     update          branch to update game subroutine 
    bsr     clear_screen    clears the screen         
    bsr     draw            branch to draw screen subroutine
    bsr     clear_screen    clears the screen
    bsr     gameplay        branch to gameplay subroutine
    bsr     clear_screen    clears the screen
    bsr     hud             branch to display HUD subroutine
    bsr     clear_screen    clears the screen
    bsr     replay          branch to replay game subroutine
    bsr     clear_screen    clears the screen
    rts                     return from gameloop: subroutine

*-------------------------------------------------------
*---------------Update Mission Progress-----------------
*  Move to battle location, engage enemy, fire and take
*  fire, complete mission and return to base
*------------------------------------------------------- 
update:
    bsr     endl            print a CR and LF
    bsr     decorate        decorate with dots using a loop
    lea     update_msg,A1   
    move.b  #14,D0
    trap    #15
    bsr     decorate
    rts
    
*-------------------------------------------------------
*---------------Draw Mission Updates--------------------
* Draw the game progress information, status regarding
* mission
*------------------------------------------------------- 
draw:
    bsr     endl
    bsr     decorate
    lea     draw_msg,A1
    move.b  #14,D0
    trap    #15
    bsr     decorate
    rts
*-------------------------------------------------------
*-----------------------Horse feed-----------------------
* Input the feed load for each horse. Feed costs money
* For an advanced mark you need to manage this resource
*------------------------------------------------------- 
feed:
    bsr     endl
    bsr     decorate
    lea     feed_msg,A1
    move.b  #14,D0
    trap    #15
    bsr     decorate
    rts

*-------------------------------------------------------
*--------------------Horses Inventory---------------------
* Number of horses to be allocated to a mission 
*------------------------------------------------------- 
horses:
    bsr     endl
    bsr     decorate
    lea     horses_msg,A1
    move.b  #14,D0
    trap    #15
    bsr     decorate
    rts

*-------------------------------------------------------
*-------------------Horse(s) Charge Speed---------------
* horses speed to and from a mission
*------------------------------------------------------- 
rate:
    bsr     endl
    bsr     decorate
    lea     rate_msg,A1
    move.b  #14,D0
    trap    #15
    bsr     decorate
    rts

*-------------------------------------------------------
*------------------Mission Distance---------------------
* Distance to battle location
*------------------------------------------------------- 
distance:
    bsr     endl
    bsr     decorate
    lea     distance_msg,A1
    move.b  #14,D0
    trap    #15
    bsr     decorate
    rts

*-------------------------------------------------------
*-----------------------Soldiers----------------------
* Number of soldiers
*-------------------------------------------------------   
soldiers:
    bsr     endl
    bsr     decorate
    lea     soldiers_msg,A1
    move.b  #14,D0
    trap    #15
    bsr     decorate
    rts

*-------------------------------------------------------
*---Game Play (Mission Progress, Battle Maneuvers)------
*------------------------------------------------------- 
gameplay:
    bsr     endl
    bsr     decorate
    lea     gameplay_msg,A1
    move.b  #14,D0
    trap    #15
    bsr     decorate
    bsr     collision
    rts

*-------------------------------------------------------
*-----------------Heads Up Display (Score)--------------
* Retrieves the score from memory location
*-------------------------------------------------------   
hud:

    bsr     endl
    bsr     decorate
    lea     hud_msg,A1
    move.b  #14,D0
    trap    #15
    move.b  (A3),D1     retrieve the value A3 point to and move to D1
    move.b  #3,D0       move literal 3 to D0
    trap    #15         intrepret value in D0, which 3 which displays D1
    bsr     decorate
    rts

*-------------------------------------------------------
*-----------------------Taking Fire---------------------
* This could be used for collision detection, if 
*-------------------------------------------------------
collision:
    move.b  #mine_loc,D1
    cmp     #100,D1 is( x == 100)?
	bne     collision_miss if x is equal to 100, then hit
collision_hit:
    *hit
    lea     hit_msg,A1
    move    #14,D0
    trap    #15
    rts
    
collision_miss:
    *miss
    lea     miss_msg,A1
    move    #14,D0
    trap    #15
    rts

*-------------------------------------------------------
*--------------------------Loop-------------------------
*-------------------------------------------------------
loop:
    move.b  #5, D3 loop counter D3=5
next:
    lea     loop_msg,A1
    move.b  #14,D0
    trap    #15
	sub     #1,D3   decrement loop counter
    bne     next    repeat until D0=0

*-------------------------------------------------------
*------------------Screen Decoration--------------------
*-------------------------------------------------------
decorate:
    move.b  #60, D3
    bsr     endl
out:
    lea     loop_msg,A1
    move.b  #14,D0
    trap    #15
	sub     #1,D3   decrement loop counter
    bne     out	    repeat until D0=0
    bsr     endl
    rts
    
clear_screen: 
    move.b  #11,D0      clear screen
    move.w  #$ff00,D1
    trap    #15
    rts
*-------------------------------------------------------
*------------------------Replay-------------------------
*-------------------------------------------------------
replay:
    bsr     endl
    lea     replay_msg,A1
    move.b  #14,D0
    trap    #15
    
    move.b  #4,D0
    trap    #15

    cmp     #exit,D1
    beq     end         if SR Z register contains 1 beq => Branch Equals
    bsr     gameloop

endl:
    movem.l D0/A1,-(A7)
    move    #14,D0
    lea     crlf,A1
    trap    #15
    movem.l (A7)+,D0/A1
    rts
    

 *-----------------------------------------------------*
 *------------------OGRIMMAR---------------------------*
 *-----------------------------------------------------*    

OgBeginning:
    
    LEA     Og_msg,A1               Load beggining Message Introducing the player to the game
    MOVE.B  #14,D0                  Load Beggining Message
    TRAP    #15                     Display begging message

    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     OgMainGate              If 1 was selected branch to Main Gate
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     OgSideEntrance          If 2 was input branch to OG Side Entrance
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG1                 If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDOG1                 Branches to Invalid1

OgSideEntrance:
  
    LEA     OgSide_msg,A1           Side entrance text
    MOVE.B  #14,D0                  Load Side Entrance Message
    TRAP    #15                     Display Side Entance Message

    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     OgThroneRoom            If 1 was selected branch Throne Room
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     OgSoldiers              If 2 was input branch to Soldiers

    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG2               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDOG2               Branches to Invalid1    
    
OgMainGate:
  
    LEA     OgMain_msg,A1           Main gate text
    MOVE.B  #14,D0                  Load Beggining Message
    TRAP    #15                     Display begging message
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Unput number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     OgThroneRoom            If 1 was selected branch Throne Room
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     OgSoldiers              If 2 was input branch to Soldiers
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG3               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDOG3               Branches to Invalid1  

OgThroneRoom:
    LEA     OgThrone_msg,A1         Throne Room Text
    MOVE.B  #14,D0                  Load Throne Message
    TRAP    #15                     Display Throne message
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compare the number 1 to the number in D1
    BEQ     OgHeavyAttack           If 1 was selected Power attack
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     OgFastAttack            If 2 was input branch to Speed Attack
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG4               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDOG4               Branches to Invalid1  

OGSoldiers:
    LEA     OgSoldiers_msg,A1       Soldiers Text
    MOVE.B  #14,D0                  Load soldiers Message
    TRAP    #15                     Display soldiers message
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compare the number 1 to the number in D1
    BEQ     OgThroneRoom            If 1 was selected Go to the throne room
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     OgThroneRoom            If 2 was input branch to Throne room
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG5               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDOG5               Branches to Invalid1 


OgHeavyAttack:
    LEA     OgHeavyAttack_msg,A1    Heavy Attack Text
    MOVE.B  #14,D0                  Load Heavy Attack Message
    TRAP    #15                     Display Heavy Attack message
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compare the number 1 to the number in D1
    BEQ     NEWGAME                 If 1 was selected Go to new Game
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG6               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDOG6               Branches to Invalid1 


OgFastAttack:
    LEA     OgFastAttack_msg,A1     Fast Attack Text
    MOVE.B  #14,D0                  Load Fast Attack Message
    TRAP    #15                     Display Fast Attack message
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compare the number 1 to the number in D1
    BEQ     OgSpare                 If 1 was selected Go to OgSpare

    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     OgKill                  If 2 was input branch to Kill
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG7               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDOG7               Branches to Invalid1 
    

OgSpare
    LEA     OgSpare_msg,A1          Spare Text
    MOVE.B  #14,D0                  Load Fast Spare  Message
    TRAP    #15                     Display Spare message
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compare the number 1 to the number in D1
    BEQ     NEWGAME                 If 1 was selected Go to New game
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG8               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDOG8               Branches to Invalid1 
    
    
    
OgKill
    LEA     OgKill_msg,A1           Kill Text
    MOVE.B  #14,D0                  Load Kill Message
    TRAP    #15                     Display Kill message
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compare the number 1 to the number in D1
    BEQ     NEWGAME                 If 1 was selected Go to New game

    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDOG9               If it is less than it is invalid, branch to Invalid    
    CMP.B   #1,D1                    Compears the number to 2
    BGT     INVALIDOG9               Branches to Invalid1 


 *-----------------------------------------------------*
 *------------------THUNDER BLUFF----------------------*
 *-----------------------------------------------------*
TBBeginning
    
    LEA     TB_msg,A1               Load beggining Message Introducing the player to the game
    MOVE.B  #14,D0                  Load Beggining Message
    TRAP    #15                     Display begging message
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     TBFront                 If 1 was selected branch to Main Gate
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     TBBack                  If 2 was input branch to OG Side Entrance
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB1               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDTB1               Branches to Invalid1 
        
TBFront
  
    LEA     TbFront_msg,A1          Load Front MEssage
    MOVE.B  #14,D0                  Move 14 into D0 Front Message
    TRAP    #15                     Display begging message with trap 15
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     TBStartFire             If 1 was selected branch to
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     TBConfront              If 2 was input branch to   

    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB2               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDTB2               Branches to Invalid1  

TBBack
    LEA     TbBack_msg,A1           Load Front MEssage
    MOVE.B  #14,D0                  Move 14 into D0 Front Message
    TRAP    #15                     Display begging message with trap 15
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     TBStartFire             If 1 was selected branch to
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     TBConfront              If 2 was input branch to  

    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB3               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDTB3               Branches to Invalid1   

TBStartFire
    LEA     TbStartFire_msg,A1      Load Front MEssage
    MOVE.B  #14,D0                  Move 14 into D0 Front Message
    TRAP    #15                     Display begging message with trap 15
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     TBRetreat               If 1 was selected branch to
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     TBThrone                If 2 was input branch to
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB4               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDTB4               Branches to Invalid1  


TBConfront
    LEA     TbSoldiers_msg,A1      Load Front MEssage
    MOVE.B  #14,D0                  Move 14 into D0 Front Message
    TRAP    #15                     Display begging message with trap 15
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     TBRetreat               If 1 was selected branch to
   
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     TBThrone                If 2 was input branch to
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB5               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDTB5               Branches to Invalid1 

TBRetreat
    LEA     TbRetreat_msg,A1      Load Front MEssage
    MOVE.B  #14,D0                  Move 14 into D0 Front Message
    TRAP    #15                     Display begging message with trap 15
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     NEWGAME               If 1 was selected branch to
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB6               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDTB6               Branches to Invalid1 


TBThrone
    LEA     TbThrone_msg,A1         Load Front MEssage
    MOVE.B  #14,D0                  Move 14 into D0 Front Message
    TRAP    #15                     Display begging message with trap 15
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     TbHeavy                 If 1 was selected branch to
    
    CMP.L   #2,D1                   Compear the number 2 to the number in D1
    BEQ     TbSmall                 If 2 was input branch to  

    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB7               If it is less than it is invalid, branch to Invalid    
    CMP.B   #2,D1                    Compears the number to 2
    BGT     INVALIDTB7               Branches to Invalid1 

TBHeavy
    LEA     TbHeavy_msg,A1          Load Front MEssage
    MOVE.B  #14,D0                  Move 14 into D0 Front Message
    TRAP    #15                     Display begging message with trap 15
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     NEWGAME                 If 1 was selected branch to 
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB8               If it is less than it is invalid, branch to Invalid    
    CMP.B   #1,D1                    Compears the number to 2
    BGT     INVALIDTB8               Branches to Invalid1

TBSmall
    LEA     TbFast_msg,A1           Load Front MEssage
    MOVE.B  #14,D0                  Move 14 into D0 Front Message
    TRAP    #15                     Display begging message with trap 15
    
    MOVE.B  #4,D0                   Place 4 for trap to call
    TRAP    #15                     User Input number
    CMP.L   #1,D1                   Compear the number 1 to the number in D1
    BEQ     NEWGAME                 If 1 was selected branch to
    
    CMP.B   #1,D1                    Compears D1 to 1
    BLT     INVALIDTB9               If it is less than it is invalid, branch to Invalid    
    CMP.B   #1,D1                    Compears the number to 2
    BGT     INVALIDTB9               Branches to Invalid1
 
    
*-------------------------------------------------------
*-------------------Data Delarations--------------------
*-------------------------------------------------------

crlf:           dc.b    $0D,$0A,0
welcome_msg:    dc.b    '************************************************************'
                dc.b    $0D,$0A
                dc.b    'ZorkQuest: Assault on Egreth Castle'
                dc.b    $0D,$0A
                dc.b    '************************************************************'
                dc.b    $0D,$0A,0
feed_msg:       dc.b    'Feed load (each horse needs at least 100 units of feed)'
                dc.b    $0D,$0A
                dc.b    'Enter feed load : ',0
horses_msg:     dc.b    'Number of horses : ',0
rate_msg:       dc.b    'One Third[1], Two Thirds[2], Standard Charge[3], ' 
                dc.b    $0D,$0A
                dc.b    'Full Charge[4], Flank Charge[5] units feed per click'
                dc.b    $0D,$0A
                dc.b    'Enter Speed : ',0
distance_msg:   dc.b    'Mission distance e.g. 40 (with 100 units of feed  '
                dc.b    $0D,$0A
                dc.b    'One Third speed 20 units remain for manuvouirs) horses '
                dc.b    $0D,$0A
                dc.b    'Horses without feed are lost.'
                dc.b    $0D,$0A
                dc.b    'Enter mission distance : ',0
soldiers_msg:       dc.b    'Each horses need at least 1 Knight and an Stable Hand'
                dc.b    $0D,$0A
                dc.b    'minimum requirement is 2 i.e. Stable Hand x 1 and Knight x 1.'
                dc.b    $0D,$0A
                dc.b    'Enter # of soldiers : ',0
gameplay_msg:   dc.b    'Add Gameplay !',0
update_msg:     dc.b    'Update Gameplay !',0
draw_msg:       dc.b    'Draw Screen !',0
hit_msg:        dc.b    'Strike!',0
miss_msg:       dc.b    'Miss!',0
loop_msg:       dc.b    '.',0
replay_msg:     dc.b    'Enter 0 to Quit any other number to replay : ',0
hud_msg:        dc.b    'Score : ',0

Opening_msg     dc.b    '***************************************************'
                dc.b    $0D,$0A
                dc.b    'YOUR JOURNY BEGINS HERE, WELCOME TO WoW ZORK!!!'
                dc.b    $0D,$0A
                dc.b    '***************************************************'
                dc.b    $0D,$0A
                dc.b    'You are in the world of Azeroth are fighting for the Alliance,'
                dc.b    $0D,$0A
                dc.b    'you must lay seige to the Horde Cities and rid the world of the Evil Horde.'
                dc.b    $0D,$0A
                dc.b    'There are 2 main cities you must destroy in this land,'
                dc.b    $0D,$0A
                dc.b    '1) Ogrimmer'
                dc.b    $0D,$0A
                dc.b    '2) Thunder Bluff'
                dc.b    $0D,$0A
                dc.b    'Which City do you wish to attempt to seige?'
                dc.b    $0D,$0A,0



Og_msg          dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You have chosen to attack the city Of the Orcs,'
                dc.b    $0D,$0A
                dc.b    'one of the most formidible forces in azeroth!'
                dc.b    $0D,$0A
                dc.b    'You and your army travel North to the Orce city,'
                dc.b    $0D,$0A
                dc.b    'as you approach you see the Huge city gates in sight'
                dc.b    $0D,$0A
                dc.b    'Do you wish to'
                dc.b    $0D,$0A
                dc.b    'Charge the front Gate? (PRESS 1)'
                dc.b    $0D,$0A
                dc.b    'OR' 
                dc.b    $0D,$0A
                dc.b    'Attack from the Side Entrace? (PRESS 2)'
                dc.b    $0D,$0A,0
                
OgSide_msg      dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You and your army make your way to the side entrance of the city'
                dc.b    $0D,$0A
                dc.b    'You soldiers prepare for battle as you charge the side of the city'
                dc.b    $0D,$0A
                dc.b    'It appears to be Only manned by 2 guards'
                dc.b    $0D,$0A
                dc.b    'You fight your way passed them but the alarm has been sounded'
                dc.b    $0D,$0A
                dc.b    'Do you wish to'
                dc.b    $0D,$0A
                dc.b    'Charge for the Throne Room (PRESS 1)'
                dc.b    $0D,$0A
                dc.b    'OR' 
                dc.b    $0D,$0A
                dc.b    'Attack The Soliders who are the imediate Threat? (PRESS 2)'
                dc.b    $0D,$0A,0
                
OgMain_msg      dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You and your army make your way to the Front Gate of city'
                dc.b    $0D,$0A
                dc.b    'You Charge to the Front gate and Smash the Gate Entrance to the city'
                dc.b    $0D,$0A
                dc.b    'Slaying Orcs as your enter the city'
                dc.b    $0D,$0A
                dc.b    'But this noise has alerted the enemy'
                dc.b    $0D,$0A
                dc.b    'Do you wish to'
                dc.b    $0D,$0A
                dc.b    'Charge for the Throne Room (PRESS 1)'
                dc.b    $0D,$0A
                dc.b    'OR' 
                dc.b    $0D,$0A
                dc.b    'Attack The Soliders who are the Approaching? (PRESS 2)'
                dc.b    $0D,$0A,0
                
OgSoldiers_msg   dc.b    ''
                dc.b    $0D,$0A
                dc.b    'Your soldiers clash with the orcs in a blood bath'
                dc.b    $0D,$0A
                dc.b    'Your forces overcome the orc army, though their was injurys'
                dc.b    $0D,$0A
                dc.b    'Do you wish to, tend to the wonded and then proceed to the throne room? (Enter 1)'
                dc.b    $0D,$0A
                dc.b    'OR'
                dc.b    $0D,$0A
                dc.b    'Sprint to the Throne Room (Enter 2)'
                dc.b    $0D,$0A,0    

OgThrone_msg     dc.b    ''
                dc.b    $0D,$0A
                dc.b    'When you get to the Throne Room you are finally confronted by the War Cheif'
                dc.b    $0D,$0A
                dc.b    'He bares his teeth at you and spits at you as he swings his mace'
                dc.b    $0D,$0A
                dc.b    'Do you wish to, Use the brute force of your Mace? (Enter 1)'
                dc.b    $0D,$0A
                dc.b    'OR'
                dc.b    $0D,$0A
                dc.b    'Use the speed of your sword?(Enter 2)'
                dc.b    $0D,$0A,0  

OgHeavyAttack_msg dc.b    ''
                  dc.b    $0D,$0A
                  dc.b    'With a Heavy well timed attack you swing your mace down upon the Warcheifs head'
                dc.b    $0D,$0A
                dc.b    'Killing Him in an instant! Any remaing enemy orcs imediatly flee'
                dc.b    $0D,$0A
                dc.b    '********************************************'
                dc.b    $0D,$0A
                dc.b    'CONGRATULATIONS YOU HAVE CONQUERED OGRIMMAR!'
                dc.b    $0D,$0A
                dc.b    '********************************************'
                dc.b    $0D,$0A
                dc.b    'Press 1 to select which City you wish to attack next'
                dc.b    $0D,$0A,0 
                
OgFastAttack_msg    dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You battle with the skilled warcheif for several minutes'
                dc.b    $0D,$0A
                dc.b    'But having your skill with a blade you take your opertunity and'
                dc.b    $0D,$0A
                dc.b    'get the upper hand on him stabbing him in the side, he falls to the floor'
                dc.b    $0D,$0A
                dc.b    'Do you wish to spare him? (Press 1)'
                dc.b    $0D,$0A
                dc.b    'OR'
                dc.b    $0D,$0A
                dc.b    'Kill him? (Press 2)'
                dc.b    $0D,$0A,0 
                
OgSpare_msg     dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You Pick the Warchief Up and throw him outside the city'
                dc.b    $0D,$0A
                dc.b    'He is picked up by a couple of his comrades'
                dc.b    $0D,$0A
                dc.b    '********************************************'
                dc.b    $0D,$0A
                dc.b    'CONGRATULATIONS YOU HAVE CONQUERED OGRIMMAR'
                dc.b    $0D,$0A
                dc.b    '********************************************'
                dc.b    $0D,$0A
                dc.b    'Press 1 to select which City you wish to attack next'
                dc.b    $0D,$0A,0
                
OgKill_msg      dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You sink your blade into the warcheif and the battle is over'
                dc.b    $0D,$0A
                dc.b    'Any of his comrades run in fear as you have slane their warcheif'
                dc.b    $0D,$0A
                dc.b    '********************************************'
                dc.b    $0D,$0A
                dc.b    'CONGRATULATIONS YOU HAVE CONQUERED OGRIMMAR'
                dc.b    $0D,$0A
                dc.b    '********************************************'
                dc.b    $0D,$0A
                dc.b    'Press 1 to select which City you wish to attack next'
                dc.b    $0D,$0A,0
     
TbFront_msg     dc.b    ''
                dc.b    $0D,$0A
                dc.b   'You charge the front gates but are seen by the Tauren Warriors'
                dc.b    $0D,$0A
                dc.b    'The Alarm has been sounded as you enter the village'
                dc.b    $0D,$0A
                dc.b    'Do you wish to'
                dc.b    $0D,$0A
                dc.b    'Set Fire to the Buildings inside the village (Press 1)'
                dc.b    $0D,$0A
                dc.b    'OR'
                dc.b    $0D,$0A
                dc.b    'Attack the Soldires Head on (Press 2)'
                dc.b    $0D,$0A,0
                
TbBack_msg      dc.b    'Your army approaches from the back of the Village giving you the element of suprise'
                dc.b    $0D,$0A
                dc.b    'Do you want to take advantage of this by'
                dc.b    $0D,$0A
                dc.b    'Starting a Fire in the village (Press 1)'
                dc.b    $0D,$0A
                dc.b    'OR'
                dc.b    $0D,$0A
                dc.b    'Suprise attack the enemy Soldiers who have not yet detected you (Press 2)'
                dc.b    $0D,$0A,0
                
TbStartFire_msg dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You Throw a fire torch on the villages thatched roofs'
                dc.b    $0D,$0A
                dc.b    'The Village starts to burn as the fire spreads from house to house'
                dc.b    $0D,$0A
                dc.b    'Do you want to'
                dc.b    $0D,$0A
                dc.b    'Steal The enemys Supplys and leave the village to burn?(Press 1)'
                dc.b    $0D,$0A
                dc.b    'OR'
                dc.b    $0D,$0A
                dc.b    'Attack the Leader of the Tauren (Press 2)'
                dc.b    $0D,$0A,0
                
TbSoldiers_msg  dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You Charge Towards the enemy warriors'
                dc.b    $0D,$0A
                dc.b    'You clash in a mightly bloodbath'
                dc.b    $0D,$0A
                dc.b    'You eventuall kill the last of the guards on the watch'
                dc.b    $0D,$0A
                dc.b    'Do you want to'
                dc.b    $0D,$0A
                dc.b    'Steal the supplys and reteat (Press 1)'
                dc.b    $0D,$0A
                dc.b    'OR '
                dc.b    $0D,$0A
                dc.b    'Attack the leader of the Tauren in the Main Village Building (Press 2) '
                dc.b    $0D,$0A,0
                
TbThrone_msg  dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You Enter the main Building of the village and the Leader of the Tauren is there.'
                dc.b    $0D,$0A
                dc.b    'He is a monsterous size nealy twice as big as your biggest soldier'
                dc.b    $0D,$0A
                dc.b    'Do you wish to'
                dc.b    $0D,$0A
                dc.b    'Attack Him with your heavy Mace (Press 1)'
                dc.b    $0D,$0A
                dc.b    'OR'
                dc.b    $0D,$0A
                dc.b    'Attack him with your sword (Press 2)'
                dc.b    $0D,$0A,0

TbRetreat_msg  dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You grab the supplys and Reatreat away from the village'
                dc.b    $0D,$0A
                dc.b    'The village will post no threat to the kingdom of Azeroth now'
                dc.b    $0D,$0A
                dc.b    '*******************************************'
                dc.b    $0D,$0A
                dc.b    'YOU HAVE SUCCESSFULLY DEFEATED THUNDER BLUFF'
                dc.b    $0D,$0A
                dc.b    '*******************************************'
                dc.b    'Press 1 to select Where you want to invade next'
                dc.b    $0D,$0A,0
                
TbHeavy_msg     dc.b    'You Swing Your mace and with one final attack you kill the Tauren Cheif by crushing his skull'
                dc.b    $0D,$0A
                dc.b    '*******************************************'
                dc.b    $0D,$0A
                dc.b    'YOU HAVE SUCCESSFULLY DEFEATED THUNDER BLUFF'
                dc.b    $0D,$0A
                dc.b    '*******************************************'
                dc.b    'Press 1 to select Where you want to invade next'
                dc.b    $0D,$0A,0
                
TbFast_msg      dc.b    'With your skillful precision you strike the Tauren cheif with a quick stabbing motion and pierce his heart'
                dc.b    $0D,$0A
                dc.b    '*******************************************'
                dc.b    $0D,$0A
                dc.b    'YOU HAVE SUCCESSFULLY DEFEATED THUNDER BLUFF'
                dc.b    $0D,$0A
                dc.b    '*******************************************'
                dc.b    'Press 1 to select Where you want to invade next'

                
TB_msg          dc.b    ''
                dc.b    $0D,$0A
                dc.b    'You have chosen to face the mighty Tauren who dwell in Thunder Bluff'
                dc.b    $0D,$0A
                dc.b    'You Travel West towards the Mountain village they live in'
                dc.b    $0D,$0A
                dc.b    'As you get closer to the village will you'
                dc.b    $0D,$0A
                dc.b    'Atack from the front? (Press 1)'
                dc.b    $0D,$0A
                dc.b    'OR'
                dc.b    'Attack from the Back (Press 2)'
                dc.b    $0D,$0A,0
                
                
UC_msg          dc.b    $0D,$0A
                dc.b    ''
                dc.b    'Welcome to Under City'
                dc.b    $0D,$0A,0
                
SM_msg          dc.b    'Welcome to SilverMoon'
                dc.b     $0D,$0A,0

INV             dc.b ''
                dc.b    $0D,$0A
                dc.b '!!!WARNING!!! That Number is Invalid Please enter a Valid Number'
                dc.b    $0D,$0A
                dc.b    $0D,$0A,0
                

health:     ds.w    1
score:      ds.w    1 reserve space for score

    end start






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
