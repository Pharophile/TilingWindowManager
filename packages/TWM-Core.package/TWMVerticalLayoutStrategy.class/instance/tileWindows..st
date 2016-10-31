layout
tileWindows: windows
	| windowsToPlace numberOfColumns numberOfRows windowWidth windowHeight clearArea origin |
	windowsToPlace := OrderedCollection newFrom: windows.
	clearArea := world clearArea.
	origin := clearArea bottomRight.

	numberOfRows := 1 max: ((windowsToPlace size + 1) sqrtFloor).
	numberOfColumns := 1 max: ((windowsToPlace size / numberOfRows) rounded).
	windowWidth := clearArea width // numberOfColumns..
	windowHeight := clearArea height // numberOfRows.
	
	Matrix 
		rows: numberOfColumns 
		columns: numberOfRows 
		tabulate: 	[:column :row| 
					windowsToPlace ifNotEmpty: [ 	|window topLeft effectiveHeight|
													window := windowsToPlace remove: windowsToPlace last.
													windowsToPlace isEmpty 
														ifTrue: [ topLeft := clearArea topLeft.
																effectiveHeight := windowHeight * (numberOfRows - row + 1)]
														ifFalse: [topLeft := origin - ((column * windowWidth) @ (row * windowHeight)).
																effectiveHeight := windowHeight].
 													self tileWindow: window bounds: (topLeft extent: windowWidth@effectiveHeight)
												]
					]