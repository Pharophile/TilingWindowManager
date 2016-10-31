move
cycleCounterClockwise
	|queue|
	queue := LinkedList newFrom: self visibleWindows.
	queue addFirst: queue removeLast.  
	self tileWindows: queue.