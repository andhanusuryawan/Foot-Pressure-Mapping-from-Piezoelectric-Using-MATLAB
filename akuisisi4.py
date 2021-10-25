import serial


s = serial.Serial(port='COM3', baudrate=115200, bytesize=8, timeout=2, stopbits=serial.STOPBITS_ONE)
res = ""
for x in range(1,33):
	res += s.readline().decode("utf-8")
a = [x.strip("---").replace("-","") for x in res.split("+++")]
b = a[:-1]
c = []
for i in range(0,2):
	c += b[0].split(' ')
	d = list(filter(None, c))
print(d)
open("hasil4(2).csv", "w").write(",".join(d))