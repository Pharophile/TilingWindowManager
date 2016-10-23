move
topWindowMoveTop23
	self newTopWindowBoundsInArea: [:area|  area topLeft  corner:  ((area bottomRight) * (1@0.66))].