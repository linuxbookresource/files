# 2022 IUSB Programming Competition
# Round 1 Problem 1
# Julian Day Number
# Solution by Janet Yu (high school volunteer)
# Uses Python 3.9.5

import math

def julian (month, day, year):
	a = math.floor((14-month)/12)
	y = math.floor(year+4800-a)
	m = math.floor(month+12*a-3)
	jdn = day + math.floor((153*m+2)/5) + 365*y + math.floor(y/4) -math.floor(y/100) + math.floor(y/400) - 32045
	return jdn

if __name__ == '__main__':
	str = input().split(" ")
	month = int(str[0])
	day = int(str[1])
	year = int(str[2])
	result = int(julian(4, 23, 2022)-julian(month, day, year))
	print (result)