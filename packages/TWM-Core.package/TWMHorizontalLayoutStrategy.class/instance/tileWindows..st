layout
tileWindows: windows
	| windowsToPlace numberOfColumns numberOfRows windowWidth windowHeight clearArea origin |
	windowsToPlace := OrderedCollection newFrom: windows.
	clearArea := world clearArea.
	origin := clearArea bottomRight.

	numberOfColumns := 1 max: ((windowsToPlace size + 1) sqrtFloor).
	numberOfRows := 1 max: ((windowsToPlace size / numberOfColumns) rounded).
	windowWidth := clearArea width // numberOfColumns..
	windowHeight := clearArea height // numberOfRows.
	
	Matrix 
		rows: numberOfRows 
		columns: numberOfColumns 
		tabulate: 	[:row :column| 
					windowsToPlace ifNotEmpty: [ 	|window topLeft effectiveWidth|
													window := windowsToPlace remove: windowsToPlace last.
													windowsToPlace isEmpty 
														ifTrue: [ topLeft := clearArea topLeft.
																effectiveWidth := windowWidth * (numberOfColumns - column + 1)]
														ifFalse: [topLeft := origin - ((column * windowWidth) @ (row * windowHeight)).
																effectiveWidth := windowWidth].
 													self tileWindow: window bounds: (topLeft extent: effectiveWidth@windowHeight)
												]
					]