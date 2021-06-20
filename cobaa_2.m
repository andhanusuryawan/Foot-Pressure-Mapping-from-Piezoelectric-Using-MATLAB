clc;
clear all;
close all;
delete(instrfindall);   %pre-emptively close all ports
s1 = serial('COM3');    %define serial port to read the Arduino
s1.BaudRate=9600;     %define baud rate
fopen(s1);
s1.ReadAsyncMode = 'continuous';
readasync(s1);
while(s1.BytesAvailable <= 0)  %wait until Arduino outputs data 
        %
end
for j = 1:20
    mData = [];
    for i=1:7 %while if constant acquisition is needed. 
        sSerialData = fscanf(s1); %read sensor
        %flushinput(s1);
        t = strsplit(sSerialData,','); % same character as the Arduino code
        dbstop if error;
            mData(3,7) = str2double(t(1)); 
            mData(3,6) = str2double(t(2));
            mData(3,5) = str2double(t(3));
            mData(3,4) = str2double(t(4));
            mData(3,3) = str2double(t(5));
            mData(3,2) = str2double(t(6));
            mData(3,1) = str2double(t(7));
            mData(2,7) = str2double(t(8));
            mData(2,6) = str2double(t(9));
            mData(2,5) = str2double(t(10));
            mData(2,4) = str2double(t(11));
            mData(2,3) = str2double(t(12));
            mData(2,2) = str2double(t(13));
            mData(2,1) = str2double(t(14));
            mData(1,7) = str2double(t(15));
            mData(1,6) = str2double(t(16));
            mData(1,5) = str2double(t(17));
            mData(1,4) = str2double(t(18));
            mData(1,3) = str2double(t(19));
            mData(1,2) = str2double(t(20));
            mData(1,1) = str2double(t(21));
%             mData(,) = str2double(t(22));
%             mData(,) = str2double(t(23));
%             mData(,) = str2double(t(24));
%             mData(,) = str2double(t(25));
%             mData(,) = str2double(t(26));
%             mData(,) = str2double(t(27));
%             mData(,) = str2double(t(28));
%             mData(,) = str2double(t(29));
%             mData(,) = str2double(t(30));
%             mData(,) = str2double(t(31));
%             mData(,) = str2double(t(32));
%             mData(,) = str2double(t(33));
%             mData(,) = str2double(t(34));
%             mData(,) = str2double(t(35));
%             mData(,) = str2double(t(36));
%             mData(,) = str2double(t(37));
%             mData(,) = str2double(t(38));
%             mData(,) = str2double(t(39));
%             mData(,) = str2double(t(40));
%             mData(,) = str2double(t(41));
%             mData(,) = str2double(t(42));
%             mData(,) = str2double(t(43));
%             mData(,) = str2double(t(44));
%             mData(,) = str2double(t(45));
%             mData(,) = str2double(t(46));
%             mData(,) = str2double(t(47));
%             mData(,) = str2double(t(48));
%             mData(,) = str2double(t(49));
            gbr = imagesc(mData);
            gbr2 = imresize(gbr, 2, 'bicubic');
            imshow(gbr2);
            colormap jet;
            colorbar;
            pause(1);
    end
    pause(1);
end    
delete(instrfindall);    % close the serial port