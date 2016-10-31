accessing
shortcuts 
	self flag: #TODO. "These mappings have to be redone with the new KM ways of Pharo5"
	^ {	
		#minimizeAllWindows 		-> 	'Minimize all windows'					-> [$r command, $m command].
		#maximizeAllWindows 		-> 	'Maximize all windows'					-> [$r command, $m shift  command].
		#tileVisibleWindows 		-> 	'Tile visible windows'					-> [$r command, $t command].
		#tileLastUsedWindows		->	'Tile last used windows'				-> [$r command, $l command].
		#tileBrowsers				->	'Tile browsers'							-> [$r command, $b command].
		#tileWorkspaces			->	'Tile workspaces'						-> [$r command, $z command].
		#tileTesters				->	'Tile testers'							-> [$r command, $u command].
		#tileMonticellos			->	'Tile monticellos'						-> [$r command, $c command].
		#tileInspectors				->	'Tile inspectors'						-> [$r command, $i command].
		#tileDebuggers			->	'Tile debuggers'						-> [$r command, $d command].
		#tileChanges				->	'Tile changes'							-> [$r command, $c shift command].
		#tileTools					->	'Tile tools'								-> [$r command, $t shift command].
		#tileSystem				->	'Tile system windows'					-> [$r command, $y command].
		#snapshotWorld			->	'Snapshot current world state'			-> [$r command, $s command].
		#worldBackward			->	'Move to previous world state'			-> [$r command, $p command].	
		#worldForward				->	'Move to next world state'				-> [$r command, $n command].
		#deleteCurrentSnapshot 	-> 	'Delete current world state'			-> [$r command, $d shift command].	
		#topWindowMoveLeft		->	'Move window to left area'				-> [$r command, $1].
		#topWindowMoveRight		->	'Move window to right area'			-> [$r command, $2].
		#topWindowMoveTop		->	'Move window to top area'				-> [$r command, $3].
		#topWindowMoveBottom	->	'Move window to bottom area'			-> [$r command, $4].
		#topWindowMoveTopLeft	->	'Move window to top left area'			-> [$r command, $5].
		#topWindowMoveTopRight	->	'Move window to top right area'		-> [$r command, $6].
		#topWindowMoveBottomLeft	->	'Move window to bottom left area'	-> [$r command, $7].
		#topWindowMoveBottomRight -> 'Move window to bottom right area'	-> [$r command, $8].
		#cycleClockwise 				-> 'Last visible window on stack come to top'	-> [$r command, $>].
		#cycleCounterClockwise 		-> 'First visible window on stack go to bottom'	-> [$r command, $<].
		#switchToNextWorld 			-> 'Switch to next world'				-> [$r command, $r command]
	}