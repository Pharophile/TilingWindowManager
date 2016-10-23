menus
updateWorkspacesMenu: aMenu
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