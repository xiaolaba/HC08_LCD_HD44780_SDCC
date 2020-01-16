@echo. off

:: qt4_blink.c,
:: ref, source code, http://hc08web.de/#examples
:: SDCC manual, http://sdcc.sourceforge.net/doc/sdccman.pdf
:: see page 29, Command line option, select target MCU
:: how to compile

:: xiaolaba, 2018-OCT-20
:: 2018-NOV-12, split command the multi lines, ^

del *.rst
del *.s19
cls


:: ^ is used to split the command to multi lines, easy for reading
:: compile multiple C files for QT4 0xEE00 / QT2 0xF800

:: -c, compile and assemble, not link 
sdcc -c -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF hd44780.c

:: compile main.c with compiled module above
sdcc    -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF ^
        main.c ^
        hd44780.rel


:::: then link them, -o is for output name
sdcc    -mhc08 --data-loc 0x80 --code-loc 0xEE00 --stack-loc 0xFF ^
        -o LCD_test.s19 ^
        main.rel ^
        hd44780.rel


::backup the project file
mkdir backup
copy LCD_test.s19 .\backup\
copy *.h          .\backup\
copy *.c          .\backup\
copy *.bat        .\backup\

::goto end
@echo off
mkdir output
copy *.s19 .\output\
move *.cdb .\output\
move *.lk  .\output\
move *.lst .\output\
move *.map .\output\
move *.rel .\output\
move *.rst .\output\
move *.sym .\output\
move *.asm .\output\

:: clear screen
::cls

@echo.
@echo *.rst is the disassembly code and cpu cycle counter list
@echo *.s19 is the firmware
:end

pause