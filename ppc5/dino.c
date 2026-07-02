#include <8051.h>
#include "keylib.h"
#include "lcdlib.h"
#include "buttonlib.h"
#include "preemptive.h"

const char dinosaur[] = {0x07, 0x05, 0x06, 0x07, 0x14, 0x17, 0x0E, 0x0A};
const char cactus[] = {0x04, 0x05, 0x15, 0x15, 0x16, 0x0C, 0x04, 0x04};

__data __at (0x28) char move_way;
__data __at (0x29) unsigned char screen_is_ready;
__data __at (0x2A) char map_piece;
__data __at (0x2B) char map_lock;
__data __at (0x2C) char top_left;
__data __at (0x2D) char top_right;
__data __at (0x2E) char bottom_left;
__data __at (0x2F) char bottom_right;
__data __at (0x3F) char draw_step;
__data __at (0x30) char key_lock;
__data __at (0x31) char key_ready;
__data __at (0x32) char pressed_key;
__data __at (0x33) char read_key;
__data __at (0x34) char dino_row;
__data __at (0x35) char level;
__data __at (0x36) char points;
__data __at (0x37) char screen_mode;
__data __at (0x38) char wait_time;

void keypad_control(void)
{
    while(1)
    {
        while(!AnyKeyPressed());
        SemaphoreWait(key_lock);
 
        pressed_key = KeyToChar();
        SemaphoreSignal(key_lock);
 
        while(AnyKeyPressed());

        key_ready = 1;
        ThreadYield();
    }
}

void render_task(void)
{
    while(1)
    {
        if (screen_mode == 0)
        {
            LCD_cursorGoTo(0, 0);
            LCD_write_char('8');
            LCD_write_char('0');
            LCD_write_char('5');
            LCD_write_char('1');
            LCD_write_char(' ');
            LCD_write_char('R');
            LCD_write_char('U');
            LCD_write_char('N');
            LCD_write_char('N');
            LCD_write_char('E');
            LCD_write_char('R');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
        
            LCD_cursorGoTo(1, 0);
            LCD_write_char('0');
            LCD_write_char('-');
            LCD_write_char('9');
            LCD_write_char(' ');
            LCD_write_char('T');
            LCD_write_char('H');
            LCD_write_char('E');
            LCD_write_char('N');
            LCD_write_char(' ');
            LCD_write_char('#');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
        }
        else if (screen_mode == 1)
        {
            LCD_cursorGoTo(0, 0);
            SemaphoreWait(map_lock);
            map_piece = top_left;
            for(draw_step = 0; draw_step < 8; ++draw_step)
            {
                __asm
                    PUSH ACC
                    MOV A, _map_piece
                    ANL A, #0x80
                    RLC A
                    ADDC A, #0
                    RL A
                    MOV DPL, A
                    LCALL _LCD_write_char
                    MOV A, _map_piece
                    RL A
                    MOV _map_piece, A
                    POP ACC
                __endasm;
            }
            map_piece = top_right;
            for(; draw_step < 15; ++draw_step)
            {
                __asm
                    PUSH ACC
                    MOV A, _map_piece
                    ANL A, #0x80
                    RLC A
                    ADDC A, #0
                    RL A
                    MOV DPL, A
                    LCALL _LCD_write_char
                    MOV A, _map_piece
                    RL A
                    MOV _map_piece, A
                    POP ACC
                __endasm;
            }
            LCD_cursorGoTo(1, 0);
            map_piece = bottom_left;
            for(draw_step = 0; draw_step < 8; ++draw_step)
            {
                __asm
                    PUSH ACC
                    MOV A, _map_piece
                    ANL A, #0x80
                    RLC A
                    ADDC A, #0
                    RL A
                    MOV DPL, A
                    LCALL _LCD_write_char
                    MOV A, _map_piece
                    RL A
                    MOV _map_piece, A
                    POP ACC
                __endasm;
            }
            map_piece = bottom_right;
            for(; draw_step < 15; ++draw_step)
            {
                __asm
                    PUSH ACC
                    MOV A, _map_piece
                    ANL A, #0x80
                    RLC A
                    ADDC A, #0
                    RL A
                    MOV DPL, A
                    LCALL _LCD_write_char
                    MOV A, _map_piece
                    RL A
                    MOV _map_piece, A
                    POP ACC
                __endasm;
            }
            SemaphoreSignal(map_lock);

            // Render dinosaur
            LCD_cursorGoTo(dino_row, 0);
            LCD_write_char('\1');
        }
        else if (screen_mode == 2)
        {
            LCD_cursorGoTo(0, 0);
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char('G');
            LCD_write_char('A');
            LCD_write_char('M');
            LCD_write_char('E');
            LCD_write_char(' ');
            LCD_write_char('O');
            LCD_write_char('V');
            LCD_write_char('E');
            LCD_write_char('R');
            LCD_write_char(' ');
            LCD_write_char(' ');

            LCD_cursorGoTo(1, 0);
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char('S');
            LCD_write_char('C');
            LCD_write_char('O');
            LCD_write_char('R');
            LCD_write_char('E');
            LCD_write_char(':');
            LCD_write_char(' ');
            
            LCD_write_char('0' + (points / 10));
            LCD_write_char('0' + (points % 10));
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char('#');
            LCD_write_char('=');
            LCD_write_char('R');
        }
        
        ThreadYield();
    }
}

void game_control(void) 
{
    while(1)
    {
        if (screen_mode == 0)
        {
            level = (char)-1;
            while(1)
            {
                if (key_ready == 1)
                {
                    SemaphoreWait(key_lock);
                    read_key = pressed_key;
                    key_ready = 0;
                    SemaphoreSignal(key_lock);

                    if ((read_key == '#') && (level >= 0) && (level <= 9)) {break;}
                
                    level = read_key - '0';
                }

                ThreadYield();
            }

            wait_time = (10 - level);
            screen_mode = 1;
            continue;
        }
        else if (screen_mode == 1)
        {
            dino_row = 0;
            points = 0;
  
            top_left = 0x12;
            top_right = 0x48;
            bottom_left = 0x24;
            bottom_right = 0x81;

            while(screen_mode == 1)
            {
                if(key_ready == 1)
                {
                    SemaphoreWait(key_lock);
                    read_key = pressed_key;
                    key_ready = 0;
                    SemaphoreSignal(key_lock);

                    if(read_key == '2')
                    {
                        dino_row = 0;
                    }
                    else if(read_key == '8')
                    {
                        dino_row = 1;
                    }
                }
                
                if (wait_time == 0)
                {
                    wait_time = (10 - level);
                    SemaphoreWait(map_lock);
                    __asm
                        PUSH ACC
                        MOV A, _top_right
                        CLR C
                        RLC A
                        MOV _top_right, A
                        MOV A, _top_left
                        RLC A
                        MOV _top_left, A
                        MOV A, _top_right
                        ADDC A, #0
                        MOV _top_right, A
                        MOV A, _bottom_right
                        CLR C
                        RLC A
                        MOV _bottom_right, A
                        MOV A, _bottom_left
                        RLC A
                        MOV _bottom_left, A
                        MOV A, _bottom_right
                        ADDC A, #0
                        MOV _bottom_right, A
                        CLR C
                        MOV A, _top_left
                        ORL A, _bottom_left
                        RLC A
                        CLR A
                        ADDC A, #0
                        ADD A, _points
                        MOV _points, A
                        POP ACC
                    __endasm;
                    SemaphoreSignal(map_lock);
                }
                else
                {
                    --wait_time;
                }
                
                if (((dino_row == 0) && (top_left & 0x80)) || ((dino_row == 1) && (bottom_left & 0x80)))
                {
                    --points;
                    screen_mode = 2;
                    continue;
                }
                
                ThreadYield();
            }
        }
        else if (screen_mode == 2)
        {
            key_ready = 0;
            while(screen_mode == 2)
            {
                if(key_ready == 1)
                {
                    SemaphoreWait(key_lock);
                    read_key = pressed_key;
                    key_ready = 0;
                    SemaphoreSignal(key_lock);

                    if(read_key == '#')
                    {
                        screen_mode = 0;
                    }
                }

                ThreadYield();
            }
            continue;
        }
    }
}

void main(void)
{       
    SemaphoreCreate(map_lock, 1);
    SemaphoreCreate(key_lock, 1);
    move_way = 1;
    Init_Keypad();
    LCD_Init();
    LCD_set_symbol('\10', dinosaur);
    LCD_set_symbol('\20', cactus);
    ThreadCreate(keypad_control);
    ThreadCreate(render_task);
    game_control();
}

void _sdcc_gsinit_startup(void) 
{
    __asm
        ljmp  _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1)
{
    __asm
        ljmp _myTimer0Handler
    __endasm;
}