f_checkip = open("test.log", "r")
for x in f_checkip:
  x= x.split("!")[2]


f_checkip.close()