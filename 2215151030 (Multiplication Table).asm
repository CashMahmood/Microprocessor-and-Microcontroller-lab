DATA SEGMENT
    fahrenheit DB 0    ; Input Fahrenheit value
    celsius    DB 0    ; Output Celsius value
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA         ; Load data segment into AX
    MOV DS, AX           ; Move AX into data segment register

    ; Input Fahrenheit value
    MOV AH, 01H          ; Function to accept single character input
    INT 21H              ; Call DOS interrupt
    SUB AL, '0'          ; Convert ASCII to numeric
    MOV fahrenheit, AL   ; Store input in "fahrenheit"

    ; Fahrenheit to Celsius Conversion
    MOV AL, fahrenheit   ; Load Fahrenheit value into AL
    SUB AL, 32           ; Subtract 32
    MOV BL, 5            ; Load multiplier (5) into BL
    MUL BL               ; Multiply (F-32) * 5
    MOV BL, 9            ; Load divisor (9) into BL
    DIV BL               ; Divide result by 9
    MOV celsius, AL      ; Store the result in "celsius"

    ; Display Celsius value
    ADD AL, '0'          ; Convert numeric value to ASCII
    MOV AH, 02H          ; Function to display a single character
    INT 21H              ; Call DOS interrupt

    ; Exit Program
    MOV AH, 4CH          ; DOS function to terminate program
    INT 21H              ; Call DOS interrupt
CODE ENDS

END START
