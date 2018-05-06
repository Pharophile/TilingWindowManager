"
I place the windows in a grid, by column and row, in the order of last used window (last used first). Top left window fill all horizontal space left.
"
Class {
	#name : #TWMHorizontalLayoutStrategy,
	#superclass : #TWMLayoutStrategy,
	#category : 'TWM-Core'
}

{ #category : #accessing }
TWMHorizontalLayoutStrategy class >> strategyName [
	^ 'Horizontal Layout' translated
]

{ #category : #layout }
TWMHorizontalLayoutStrategy >> tileWindows: windows [
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
]
