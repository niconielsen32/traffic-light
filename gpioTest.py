import RPi.GPIO as GPIO

red = 11
yellow = 13
green = 15

button = 7

GPIO.setmode(GPIO.BOARD)

GPIO.setup(button, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

GPIO.setup(red, GPIO.OUT)
GPIO.setup(yellow, GPIO.OUT)
GPIO.setup(green, GPIO.OUT)

try:
	while True:
		if GPIO.input(button) == 1:
			GPIO.output(red, 1)
			GPIO.output(yellow, 1)
			GPIO.output(green, 1)

		else:
			GPIO.output(red, 0)
			GPIO.output(yellow, 0)
			GPIO.output(green, 0)


except KeyboardInterrupt:
	GPIO.cleanup()
	print("gpio cleaned up")
