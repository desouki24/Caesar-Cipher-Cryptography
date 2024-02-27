.MODEL SMALL
.STACK 100H
.DATA 
Key DB ?
message DB 'ABCDEF' , '$'
.CODE 
MAIN PROC 
MOV AX ,@DATA 
MOV DS ,AX

MOV AH,2H 
MOV DL, '?'
INT 21H


INP :
MOV AH ,08H
INT 21H
CMP AL ,31H
JL INP ;INP IF <1
CMP AL ,39H
JG INP ;INP IF >9

MOV Key ,AL

MOV CX,0
MOV SI,0
MOV BL,key 
SUB BL,30H

Loop1:


ADD [message+SI] ,BL
CMP [message+SI] ,5AH 
JL  increment 


MODU :
SUB [message+SI] ,5AH 
ADD [message+SI] ,41H


increment:
INC CX 
INC SI 
CMP CX ,5
JL Loop1


MOV AH,2
MOV DL,0DH
INT 21H
MOV DL ,0AH 
INT 21H


LEA DX ,message
MOV AH ,9H 
INT 21H 

MOV AH ,4CH
INT 21H


