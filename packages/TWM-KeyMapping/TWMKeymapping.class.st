"
I build and handle TilingWM shortcuts in Settings Browser. 

Depends on KeyMapping. See #shortcuts for all shortcuts defined.
"
Class {
	#name : #TWMKeymapping,
	#superclass : #Object,
	#category : 'TWM-KeyMapping'
}

{ #category : #shortcuts }
TWMKeymapping class >> buildKeyMappingOn: aBuilder [  
	<keymap>
	"See shortucts accessor to add/change a shortcut "
	
	
	self shortcutsActionAndKeysDo: [:action :keys :description|
"		self halt."
		(aBuilder shortcut: action)
			category: self shortcutCategory
			default: keys
			do: [  self windowManager perform: action ]
			description: description.
	].

	
	aBuilder setAsGlobalCategory: self shortcutCategory.
	
]

{ #category : #shortcuts }
TWMKeymapping class >> buildSettingsOn: aBuilder [  
	<systemsettings>
	"See shortucts accessor to add/change a shortcut "

	(aBuilder group: #twmShortcuts)
		label: 'Key mapping' translated;
		description: 'Tiling Window Manager shortcuts' translated;
		parent: #twm;
		order: 10;
		with: [
			self shortcutsActionAndDescriptionDo: [: aName :aDescription| 
								(aBuilder shortcut: aName)
											shortcutName: aName;
											category: self shortcutCategory;
											label:  aDescription 					].
		].
]

{ #category : #accessing }
TWMKeymapping class >> shortcutCategory [ 
	^ #twmShortcuts
]

{ #category : #accessing }
TWMKeymapping class >> shortcuts [ 
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
]

{ #category : #enumerating }
TWMKeymapping class >> shortcutsActionAndDescriptionDo: aBlock [
	self shortcuts do: [:actionDescShortcut|
		aBlock 
			value: actionDescShortcut key key
			value: actionDescShortcut key value.
	].
]

{ #category : #enumerating }
TWMKeymapping class >> shortcutsActionAndKeysDo: aBlock [
	self shortcuts do: [:actionDescShortcut|
		aBlock 
			value: actionDescShortcut key key
			value: actionDescShortcut value value
			value: actionDescShortcut key value.
	].
]

{ #category : #enumerating }
TWMKeymapping class >> shortcutsDo: aBlock [
	self shortcuts do: [:actionDescShortcut| |action description shortcutBlock|
		action := actionDescShortcut key key.
		description := actionDescShortcut key value.
		shortcutBlock := actionDescShortcut key value. "because Character>>#command is not in PharoCore"
	].
]

{ #category : #accessing }
TWMKeymapping class >> windowManager [
	^ TilingWM instanceForCurrentWorld
]
