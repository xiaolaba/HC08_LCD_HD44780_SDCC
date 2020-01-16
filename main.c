/* REF : https://github.com/polprog/stm8-hd44780
 * HD44780 LCD test/demo program for HC08
 * xiaolaba
 * 2020-JAN-17
 * SDCC 3.9.0
 */

#define F_CPU_KHZ 9800L
#include <mc68hc908qy.h>

//#include <stdint.h>

#include "hd44780.h"
#include "delay.h"

void main(void){

  lcd_gpioinit();
  lcd_init();
  lcd_send_byte(LCD_CTL | LCD_ON | LCD_CUR_ON | LCD_CUR_BLNK, LCD_CMD);
  
  lcd_puts("Hello from HC08");
  lcd_setpos(1, 0);
  lcd_puts(" to #avr <3 !");
  lcd_send_byte(LCD_CTL | LCD_ON | LCD_CUR_OFF, LCD_CMD);

  while(1);
}
