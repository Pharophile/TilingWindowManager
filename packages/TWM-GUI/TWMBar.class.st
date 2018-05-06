"
I create a simple dock for TilingWM actions.

Open with:

	TWMBar  open.
"
Class {
	#name : #TWMBar,
	#superclass : #Object,
	#instVars : [
		'dock',
		'wm',
		'worldRecorder',
		'worldManager',
		'buttonsCollector'
	],
	#classVars : [
		'Default',
		'ShowTWMBar'
	],
	#category : 'TWM-GUI'
}

{ #category : #'open/close' }
TWMBar class >> close [
	self default close.
	self reset.
]

{ #category : #defaults }
TWMBar class >> default [
	^ Default ifNil: [Default := self new]
]

{ #category : #'open/close' }
TWMBar class >> open [
	^ self default open.
]

{ #category : #defaults }
TWMBar class >> reset [
     "self reset"
	Default := nil.
]

{ #category : #settings }
TWMBar class >> showTWMBar [
	^ ShowTWMBar ifNil: [ShowTWMBar := false].
]

{ #category : #settings }
TWMBar class >> showTWMBar: aBoolean [
	(ShowTWMBar := aBoolean)
		ifTrue: [self open]
		ifFalse: [self close].
		
	^ ShowTWMBar
]

{ #category : #menus }
TWMBar >> addWindows: windows toMenu: aMenu [
	self addWindows: windows toMenu: aMenu withLabel: [:aWindow| aWindow label].
]

{ #category : #menus }
TWMBar >> addWindows: windows toMenu: aMenu withLabel: aBlock [
	"aMenu addLine."
	windows do: [:aWindow| 
						aMenu 
							add:  (aBlock value: aWindow)
							target: aWindow 
							selector:  #expandAndActivate.
						aMenu lastItem icon: aWindow taskbarIcon].	
	
]

{ #category : #'custom-buttons' }
TWMBar >> allButtonBuilders [ 
	^ self allButtonPragmas 
				collect: [:aPragma|  |aButtonBuilder|
									aButtonBuilder := TWMBarButtonBuilder new.
									aPragma methodClass theNonMetaClass 
											perform: aPragma selector 
											with: aButtonBuilder.
									aButtonBuilder].
]

{ #category : #'custom-buttons' }
TWMBar >> allButtonPragmas [ 
	^ self buttonsCollector reset collected.
]

{ #category : #icon }
TWMBar >> bottomIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph leftCenter corner:  aMorph bottomRight ].
]

{ #category : #icon }
TWMBar >> bottomLeftIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph leftCenter corner:  aMorph bottomCenter ].
]

{ #category : #icon }
TWMBar >> bottomRightIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph center corner:  aMorph bottomRight ].
]

{ #category : #icon }
TWMBar >> browsersMenuIcon [ 
	^ Smalltalk tools browser taskbarIcon
]

{ #category : #factory }
TWMBar >> buttonAction: aBlock icon: aForm balloon: aBalloon [
	| button |
	button := IconicButton  new
						target: aBlock;
						actionSelector: #value;
						labelGraphic: aForm;		"labelGraphic: aForm or labelFromString: aBalloon"						
						color: Color transparent.
	aBalloon ifNotNil: [ button setBalloonText: aBalloon ].
	^ button
]

{ #category : #'custom-buttons' }
TWMBar >> buttonsCollector [
	^ buttonsCollector ifNil: [buttonsCollector := self newButtonsCollector]
]

{ #category : #'open/close' }
TWMBar >> close [
	dock ifNotNil: [ dock delete ].
]

{ #category : #factory }
TWMBar >> createNewWorldNamed: aString [
	| newWorld |
	newWorld := self worldManager newWorldNamed: aString.
	TWMBar showTWMBar ifTrue: [ TWMBar new openInWorld: newWorld ].
	self worldManager switchToWorld: newWorld.
]

{ #category : #'custom-buttons' }
TWMBar >> customButtons [
	^ (self allButtonBuilders 
			sort: [:a :b|  a priority > b priority]) 
			collect: [:aBuilder| aBuilder button]
]

{ #category : #icon }
TWMBar >> deleteIcon [
	^ dock icons smallDeleteIcon 
]

{ #category : #icon }
TWMBar >> deleteSnapshotIcon [  
	^ dock icons smallDeleteIcon.
]

{ #category : #accessing }
TWMBar >> dock [
	^ dock
]

{ #category : #icon }
TWMBar >> fullIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph topLeft corner:  aMorph bottomRight ].
]

{ #category : #icon }
TWMBar >> iconSubmorphBounds: aBlock [
	|icon|
	
	icon := Morph new
				color: Color transparent;
				extent: 16@16.
	icon addMorph: ( Morph new
						color: Color gray darker;
						bounds: (aBlock value: icon)).
	^ icon imageForm.
]

{ #category : #accessing }
TWMBar >> icons [
	^Smalltalk ui icons
]

{ #category : #icon }
TWMBar >> leftIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph topLeft corner:  aMorph bottomCenter ].
]

{ #category : #icon }
TWMBar >> maximizeAllWindowsIcon [ 
	^ dock icons windowMaximizeForm
]

{ #category : #icon }
TWMBar >> minimizeAllWindowsIcon [ 
	^ dock icons windowMinimizeForm
]

{ #category : #icon }
TWMBar >> monticelloMenuIcon [ 
	^  MCWorkingCopyBrowser taskbarIcon
]

{ #category : #icon }
TWMBar >> multipleWorldIcon [
	^ self icons smallObjectsIcon
]

{ #category : #menus }
TWMBar >> newBrowsersMenu [
	"This is where we rebuild the menu for browsers"
	
	^ self newMenu: #updateBrowsersMenu:  icon: self browsersMenuIcon help: 'Browsers actions'
]

{ #category : #'custom-buttons' }
TWMBar >> newButtonsCollector [ 
	| collector |
	collector := (PragmaCollector filter: [	:pragma | 
											pragma keyword = self pragmaButtonKeyword ]).
	collector whenChangedSend: #rebuildDockContent to: self.
	^ collector 
]

{ #category : #factory }
TWMBar >> newFixedSpacer [ 
	^ AlignmentMorph new
		extent: 25@25;
		hResizing: #shrinkWrap;
		vResizing:  #shrinkWrap;  
		color: Color  transparent.

]

{ #category : #icon }
TWMBar >> newIconWithString: aString [
	^ ((SimpleButtonMorph new)
		extent: 16 @ 16;
		color: Color transparent;
		label: aString) imageForm
]

{ #category : #menus }
TWMBar >> newMenu: aSelector icon: aForm help: aString [ 
	^ DockingBarMenuItemMorph new
		contents: '';
		subMenu: (TWMUpdatingMenuMorph new updater: self updateSelector: aSelector);
		icon: aForm;
		setBalloonText: aString.
]

{ #category : #menus }
TWMBar >> newMonticellosMenu [
	^ self newMenu: #updateMonticellosMenu:  icon: self monticelloMenuIcon help: 'Monticello tools actions'
]

{ #category : #menus }
TWMBar >> newMultipleWorldMenu [
	^ self newMenu: #updateMultipleWorldMenu:  icon: self multipleWorldIcon help: 'Multiple world'
]

{ #category : #menus }
TWMBar >> newOtherToolsMenu [
	^ self newMenu: #updateOtherToolsMenu:  icon: self otherToolsMenuIcon help: 'Other tools actions'
]

{ #category : #factory }
TWMBar >> newSpacer [ 
	^ AlignmentMorph newSpacer: Color transparent

]

{ #category : #menus }
TWMBar >> newWindowsMenu [
	^ self newMenu: #updateWindowsMenu:  icon: self windowsIcon help: 'All windows actions'
]

{ #category : #menus }
TWMBar >> newWorkspacesMenu [
	^ self newMenu: #updateWorkspacesMenu:  icon: self workspacesMenuIcon help: 'Playgrounds and Workspaces actions'
]

{ #category : #callback }
TWMBar >> newWorld [
	| worldName |
	worldName := (UIManager default request: 'Enter the new World name').
	worldName ifNil: [ ^ self ].
	self createNewWorldNamed: worldName.
	TaskbarMorph showTaskbarPreferenceChanged.
]

{ #category : #menus }
TWMBar >> newWorldMenu [
	^ DockingBarMenuItemMorph new
		contents: '';
		subMenu:  (TWMUpdatingMenuMorph new updater: self updateSelector: #updateWorldMenu:);
		icon: self openWorldMenuIcon;
		setBalloonText: 'Open World menu'.
]

{ #category : #'open/close' }
TWMBar >> open [
	self openInWorld: World.  
	  
]

{ #category : #'open/close' }
TWMBar >> openInWorld: aWorld [
	wm := TilingWM forWorld: aWorld.
	dock := TWMDockingBarMorph new
				adhereToLeft;
				yourself.
	self rebuildDockContent.
	dock openInWorld: aWorld.
	  
]

{ #category : #icon }
TWMBar >> openNewIcon [
	^  self newIconWithString: '+'.
]

{ #category : #icon }
TWMBar >> openWindowsMenuIcon [
	^ dock icons smallForwardIcon
]

{ #category : #icon }
TWMBar >> openWorldMenuIcon [ 
^ (Form
	extent: 16@22
	depth: 32
	fromArray: #( 16777215 16777215 16777215 16777215 16777215 16777215 133690800 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 100136368 83359152 234354096 150468016 536343984 33027504 133690800 33027504 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 603452848 1548898875 3241094689 3446171466 1329939761 217576880 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 3476502311 4286479706 4289243000 3713554239 988210340 586675632 251131312 16777215 16777215 16777215 83359152 217576880 351794608 502789552 637007280 771225008 3259253809 4289045365 4290821769 3646445374 16777216 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1509949440 4096798498 4282400814 4283716412 4130090016 2423616595 637007280 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1074728715 4177526784 4281150496 4278190080 4148840757 1006632960 335017392 737670576 301462960 16777215 16777215 16777215 16777215 16777215 16777215 1979711488 3472883712 4227858432 4280492825 4278190080 4262333962 3508082962 1778384896 16777215 234354096 318240176 83359152 16777215 16777215 16777215 16777215 1056964608 3439329280 4278190080 4279834898 4278190080 4278190080 3204777220 838860800 16777215 16777215 16777215 49804720 16777215 16777215 16777215 16777215 16777215 1107296256 3909091328 4279242763 4278190080 3388997632 1090519040 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 2130706432 4278190080 3574073350 1929379840 67108864 754974720 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 2650800128 2600468480 167772160 234881024 2634022912 2483027968 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1526726656 100663296 2080374784 3707764736 4278190080 2634022912 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1140850688 3489660928 4278190080 4278190080 3690987520 1107296256 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777216 3607101440 4278190080 3724541952 2264924160 301989888 318767104 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 587202560 3959422976 2432696320 301989888 16777215 184549376 3271557120 167772160 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1358954496 1358954496 16777215 83886080 1811939328 3472883712 4278190080 771751936 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 67108864 134217728 2080374784 3573547008 4278190080 4278190080 4244635648 1275068416 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 1174405120 3506438144 4278190080 4278190080 4278190080 3942645760 2214592512 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 2868903936 4278190080 4278190080 3674210304 2399141888 587202560 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 3271557120 3489660928 1845493760 134217728 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 2952790016 251658240 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215 16777215)
	offset: 0@0)
]

{ #category : #icon }
TWMBar >> otherToolsMenuIcon [
	^ dock icons smallDoItIcon
]

{ #category : #'custom-buttons' }
TWMBar >> pragmaButtonKeyword [ 
	^ 'twmBarButton'
]

{ #category : #'open/close' }
TWMBar >> rebuildDockContent [

	dock
		removeAllMorphs;
		addMorph: (self buttonAction: [wm topWindowMoveTop23  ] icon: self top23Icon  balloon: 'Make window top 2/3');
		addMorph: (self buttonAction: [wm topWindowMoveFull ] icon: self fullIcon  balloon: 'Make window full area');
		addMorph: (self buttonAction: [wm topWindowMoveBottomLeft ] icon: self bottomLeftIcon balloon: 'Move window to bottom left area');
		addMorph: (self buttonAction: [wm topWindowMoveBottomRight ] icon: self bottomRightIcon balloon: 'Move window to bottom right area');
		addMorph: (self buttonAction: [wm topWindowMoveTopRight ] icon: self topRightIcon balloon: 'Move window to top right area');
		addMorph: (self buttonAction: [wm topWindowMoveTopLeft ] icon: self topLeftIcon balloon: 'Move window to top left area');
		
		addMorph: (self buttonAction: [wm topWindowMoveBottom ] icon: self bottomIcon balloon: 'Move window to bottom area');
		addMorph: (self buttonAction: [wm topWindowMoveTop ] icon: self topIcon balloon: 'Move window to top area');
		
		addMorph: (self buttonAction: [wm topWindowMoveRight ] icon: self rightIcon balloon: 'Move window to right area');
		addMorph: (self buttonAction: [wm topWindowMoveLeft ] icon: self leftIcon balloon: 'Move window to left area');
		
		addMorph: self newSpacer;
		addMorph:  (LabelMorph new model: self; getTextSelector: #worldRecorderPosition); 
		addMorph: (self buttonAction: [wm deleteCurrentSnapshot. self changed: #worldRecorderPosition] icon: self deleteSnapshotIcon balloon: 'Delete current snapshot of world state');
		addMorph: (self buttonAction: [wm worldForward. self changed: #worldRecorderPosition] icon: self worldForwardIcon balloon: 'Undo restore previous world state');
		addMorph: (self buttonAction: [wm worldBackward. self changed: #worldRecorderPosition] icon: self worldBackwardIcon balloon: 'Restore previous world state');
		addMorph: (self buttonAction: [wm snapshotWorld. self changed: #worldRecorderPosition] icon: self snapshotWorldIcon balloon: 'Snapshot current world state');
		addMorph: self newSpacer.
		
	"self customButtons do: [:aButton| self dock addMorph: aButton]."
		
	self dock	
		addMorph: self newSpacer;
				
		addMorph: (self newMultipleWorldMenu);
		
		addMorph: self newFixedSpacer;
		
		addMorph: (self newOtherToolsMenu);
		addMorph: (self newMonticellosMenu);
		addMorph: (self newWorkspacesMenu);
		addMorph: (self newBrowsersMenu);
		addMorph: (self newWindowsMenu).
		
		" Until we can fix the World menu integration, this is disabled "
		"addMorph: self newFixedSpacer;
		
		addMorph: (self newWorldMenu)."
]

{ #category : #icon }
TWMBar >> rightIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph topCenter corner:  aMorph bottomRight ].
]

{ #category : #icon }
TWMBar >> snapshotWorldIcon [
	^ dock icons smallScreenshotIcon.
]

{ #category : #icon }
TWMBar >> tileChangesIcon [ 
	^ ChangeList taskbarIcon
]

{ #category : #icon }
TWMBar >> tileDebuggersIcon [ 
	^ Smalltalk tools debugger taskbarIcon 
]

{ #category : #icon }
TWMBar >> tileIcon [ 
	^ dock icons smallWindowIcon
]

{ #category : #icon }
TWMBar >> tileInspectorsIcon [ 
	^ Smalltalk tools inspector taskbarIcon
]

{ #category : #icon }
TWMBar >> tileLastUsedWindowsIcon [
	^ self newIconWithString: '««'.
]

{ #category : #icon }
TWMBar >> tileSystemIcon [
	^ dock icons smallConfigurationIcon
]

{ #category : #icon }
TWMBar >> tileTestersIcon [ 
	^ TestRunner taskbarIcon
]

{ #category : #icon }
TWMBar >> tileVisibleWindowsIcon [ 
	^ dock icons smallWindowIcon
]

{ #category : #icon }
TWMBar >> top23Icon [
	^ self iconSubmorphBounds:[:aMorph| aMorph topLeft corner:  ((aMorph bottomRight)*(1@0.66)) ].
]

{ #category : #icon }
TWMBar >> topIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph topLeft corner:  aMorph rightCenter ].
]

{ #category : #icon }
TWMBar >> topLeftIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph topLeft corner:  aMorph center ].
]

{ #category : #icon }
TWMBar >> topRightIcon [
	^ self iconSubmorphBounds:[:aMorph| aMorph topCenter corner:  aMorph rightCenter ].
]

{ #category : #menus }
TWMBar >> updateBrowsersMenu: aMenu [

	aMenu 
		add: 'Tile browsers' target: self windowManager selector: #tileBrowsers icon: self tileIcon;
		add: 'New browser' target: Smalltalk tools selector: #openClassBrowser icon: self openNewIcon.
	
	self 
		addWindows: self windowManager browsers 
		toMenu: aMenu.


]

{ #category : #menus }
TWMBar >> updateMonticellosMenu: aMenu [
	aMenu 
		add: 'Tile Monticello tools' target: self windowManager selector: #tileMonticellos icon: self tileIcon;
		add: 'New Monticello browser' target: Smalltalk tools selector: #openMonticelloBrowser icon: self openNewIcon.
	
	self 
		addWindows: self windowManager monticellos 
		toMenu: aMenu.
		
]

{ #category : #menus }
TWMBar >> updateMultipleWorldMenu: aMenu [

	aMenu 
		add: 'New World' target: self selector: #newWorld icon: self openNewIcon;
		add: 'Delete current World' target: TWMWorldManager instance selector: #deleteCurrentWorld icon: self deleteIcon.";
		addLine."
	
	self worldManager worlds keys do: 	[:aWorldName|
												
												aMenu 
													add: aWorldName asString
													target: [self worldManager switchToWorldNamed: aWorldName ifAbsent: [Transcript show: 'Missing world', aWorldName;cr. 'Pharo']]
													selector: #value ].
]

{ #category : #menus }
TWMBar >> updateOtherToolsMenu: aMenu [
	| windows |
	aMenu 
		add: 'New TestRunner' target: Smalltalk tools selector: #openTestRunner icon: self openNewIcon.
	
	"All the windows that are not in the tooling"
	windows := ((self windowManager windows 
					copyWithoutAll: self windowManager browsers)
						copyWithoutAll: self windowManager workspaces)
						 	copyWithoutAll: self windowManager monticellos.
	self 
		addWindows: windows 
		toMenu: aMenu.
		
]

{ #category : #menus }
TWMBar >> updateWindowsMenu: aMenu [
	aMenu 
		add: 'Tile visible windows' target: self windowManager selector: #tileVisibleWindows icon: self tileVisibleWindowsIcon;
		add: 'Tile last used windows' target: self windowManager selector: #tileLastUsedWindows icon: self tileLastUsedWindowsIcon;
		add: 'Maximize all windows' target: self windowManager selector: #maximizeAllWindows icon: self maximizeAllWindowsIcon;
		add: 'Minimize all windows' target: self windowManager selector: #minimizeAllWindows icon: self minimizeAllWindowsIcon.
		
	
	self 
		addWindows: self windowManager windows 
		toMenu: aMenu.
]

{ #category : #menus }
TWMBar >> updateWorkspacesMenu: aMenu [
	aMenu 
		add: 'Tile playgrounds' target: self windowManager selector: #tileWorkspaces icon: self tileIcon;
		add: 'New playground' target: Smalltalk tools selector: #openWorkspace icon: self openNewIcon.
	
	self 
		addWindows: self windowManager workspaces 
		toMenu: aMenu 
		withLabel: [:aWindow|  ((aWindow model respondsTo: #contentsFirstLine) 
													ifTrue: [ 
														| firstLine |
														firstLine := aWindow model contentsFirstLine.
														firstLine
															ifEmpty: [aWindow label] 
															ifNotEmpty: [:contentsFirstLine | (contentsFirstLine truncateTo: 45) , ' ...']
														]
													ifFalse: [ 
														aWindow label
														]
												)]
]

{ #category : #menus }
TWMBar >> updateWorldMenu: aMenu [
	self windowManager world worldMenu items do: [:aMenuItem| aMenu addMenuItem:  aMenuItem].
]

{ #category : #accessing }
TWMBar >> windowManager [
	^ wm ifNil: [wm := TilingWM forWorld: World].
]

{ #category : #icon }
TWMBar >> windowsIcon [ 
	^ dock icons smallWindowIcon
]

{ #category : #icon }
TWMBar >> workspacesMenuIcon [ 
	^ Workspace taskbarIcon
]

{ #category : #icon }
TWMBar >> worldBackwardIcon [
	^ self newIconWithString: '<'.
]

{ #category : #icon }
TWMBar >> worldForwardIcon [
	^ self newIconWithString: '>'.
]

{ #category : #accessing }
TWMBar >> worldManager [
	^ worldManager ifNil: [worldManager := TWMWorldManager instance].
]

{ #category : #callback }
TWMBar >> worldRecorderPosition [
	^ String streamContents: [:aStream| wm printWorldRecorderPositionOn: aStream]   
]
