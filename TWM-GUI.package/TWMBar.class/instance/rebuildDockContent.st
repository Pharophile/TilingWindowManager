open/close
rebuildDockContent

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
		addMorph: (self newWindowsMenu);
		
		addMorph: self newFixedSpacer;
		
		addMorph: (self newWorldMenu).