move
cycleClockwise
	|queue|
	self flag: #TODO. "Need some love as World windws isn't working"
	queue := LinkedList newFrom: self visibleWindows.
	queue addLast: queue removeFirst.
	self tileWindows: queue.