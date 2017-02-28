#!/usr/bin/python

def getopts(argv):
	opts = {}
	while argv:
		if argv[0][0] == '-': # find "-name value" pairs
			opts[argv[0]] = argv[1] # dict key is "-name" arg
			argv = argv[2:]
		else:
			argv = argv[1:]
	return opts


if __name__ == '__main__':
	from sys import argv 
	import sys, time
	myargs = getopts(argv)
	if not ('-s' in myargs and '-o' in myargs):
		print("Usage: %s -s speed(kB/s) -o file" % argv[0])
		sys.exit(1)
	else:
		speed = int(myargs['-s'])
		filename = myargs['-o']

	try:
		bufsize = 0	# to force flushing
		fd = open(filename, "w", bufsize)
	except IOError:
		print("Can't open file %s for writing. Exiting." % filename)
		sys.exit(1)

#	if speed > 200:
#		print("It's too dangerous to waste your disk space at %d kB/s rate! Exiting!" % speed)
#		sys.exit(1)

	print("Writing with speed %d kB/s to file %s" % (speed, filename))	
	buf = 1024 * '0'	# initialize the 1K string
	try: 
		while True: 	
			for i in range (speed):
				fd.write(buf)
				fd.flush()
			print("%d kiloBytes written!" % speed)
			time.sleep(1)
	except KeyboardInterrupt:
		print("Stopping!")
		sys.exit(0)
