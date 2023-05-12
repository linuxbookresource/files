# 2022 IUSB Programming Competition
# Round 1 Problem 2
# Credit Card Number
# Solution by Janet Yu (high school volunteer)
# Uses Python 3.9.5

if __name__ == '__main__':
	number = input()
	sum = 0

	for x in number:
		a = int(x)
		sum += a

	if sum%29 == 5:
		print("valid")
	else:
		print("not valid")