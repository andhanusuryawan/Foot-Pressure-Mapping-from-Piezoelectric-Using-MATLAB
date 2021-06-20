clear
 clc
s=serial('COM3','BaudRate',9600);
fopen(s);
 readData=fscanf(s) %reads "Ready" 
writedata=uint16(500); %0x01F4
fwrite(s,writedata,'uint16') %write data
 for i=1:10 %read 2 lines of data
readData=fscanf(s)
end
 fclose(s);
 delete(s);