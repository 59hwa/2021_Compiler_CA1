# 2021_Compiler_CA1
1. HOW to compile?
After executing cmd in Windows and terminal in Mac, move to where the file is through the cd command.

Run code for windows:
bison -d y.y
flex l.l
gcc lex.yy.c y.tab.c

Run code for Mac:
bison -d y.y
flex l.l
gcc lex.yy.c y.tab.c -o test


Then, New a.out or test file will be occur and you can test sql query input.


2. HOW to Test update and Select
A txt file for test is attached to each folder. You can try running each line. In addition, you can proceed with the test at your disposal.

After compiling and executing, when input is placed, it outputs whether it makes it sql query valid.

If your input something wrong thing, We output where the error occurred or what input occurred.
