#! /usr/bin/python

import random, os, sys

#If True, Colors will be more saturated. If false, colors will be more random.
saturatedColors = True

try: 
    color = sys.argv[1]
except: 
    color = False

try: 
    extra_commands = " {}".format(sys.argv[2])
except: 
    extra_commands = ""

def padStr(string,length):
	if len(string) < length:
		return padStr("0"+string,length)
	else:
		return string

def rand(x,y):
	return padStr(str(hex(random.randint(x,y)))[2:],4)

if saturatedColors and not color:
	randDecide = random.randint(0,5)
	if randDecide == 0:
		rand1 = "ffff"
		rand2 = "0000"
		rand3 = "0000"
	elif randDecide == 1:
		rand1 = "0000"
		rand2 = "ffff"
		rand3 = "0000"
	elif randDecide == 2:
		rand1 = "0000"
		rand2 = "0000"
		rand3 = "ffff"
	elif randDecide == 3:
		rand1 = "ffff"
		rand2 = "ffff"
		rand3 = "0000"
	elif randDecide == 4:
		rand1 = "0000"
		rand2 = "ffff"
		rand3 = "ffff"
	elif randDecide == 5:
		rand1 = "ffff"
		rand2 = "0000"
		rand3 = "ffff"
	else:
		rand1 = "ffff"
		rand2 = "ffff"
		rand3 = "ffff"
elif color != False:
	if color == "red":
		rand1 = "ffff"
		rand2 = "0000"
		rand3 = "0000"
	elif color == "green":
		rand1 = "0000"
		rand2 = "ffff"
		rand3 = "0000"
	elif color == "blue":
		rand1 = "0000"
		rand2 = "0000"
		rand3 = "ffff"
	elif color == "yellow":
		rand1 = "ffff"
		rand2 = "ffff"
		rand3 = "0000"
	elif color == "teal":
		rand1 = "0000"
		rand2 = "ffff"
		rand3 = "ffff"
	elif color == "pink":
		rand1 = "ffff"
		rand2 = "0000"
		rand3 = "ffff"
	else:
		rand1 = "ffff"
		rand2 = "ffff"
		rand3 = "ffff"
	
else:
	randDecide = random.randint(0,2)
	if randDecide == 0:
		rand1 = rand(60000,65535)
		rand2 = rand(0,65535)
		rand3 = rand(0,65536)
	elif randDecide == 1:
		rand1 = rand(0,65535)
		rand2 = rand(60000,65535)
		rand3 = rand(0,65535)
	elif randDecide == 2:
		rand1 = rand(0,65535)
		rand2 = rand(0,65535)
		rand3 = rand(60000,65535)
	else:
		rand1 = rand(0,9999)
		rand2 = rand(0,9999)
		rand3 = rand(0,9999)

alpha = "6000"

command = "urxvt -depth 32 -fg grey90 -bg rgba:{}/{}/{}/{} {}".format(rand1,rand2,rand3,alpha, extra_commands)

os.system(command)
