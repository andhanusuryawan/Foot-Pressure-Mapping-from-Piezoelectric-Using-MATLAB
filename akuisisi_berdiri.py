import serial

s = serial.Serial(port='COM3', baudrate=115200, bytesize=8, timeout=2, stopbits=serial.STOPBITS_ONE)
res = ""
for x in range(0,54):
	res += s.readline().decode("utf-8")
a = [x.strip("---").replace("-","") for x in res.split("+++")]
b = a[:-1]
c = []
for i in range(0,1):
	c += b[i].split(' ')
	d = list(filter(None, c))
print(d)
open("coba/10 Maret 2022 (2).csv", "w").write(",".join(d))