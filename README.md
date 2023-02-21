# Shellcode
An assembly and C shellcode that is recieved as data in a victim and when activated sets up a message box.

How does it work?
I wrote it first in C, as you can see in the file sellcode_c_part. 
I then compiled it and opened the .exe file in IDA.
I used my RE skills to find the necesery parts and than created a new assembly file with the neede code.
After adjusting the code to work without globals (creating my own "data section" with Lablels before every needed string) and imports(Using the DDBT to find the image base of the process)
