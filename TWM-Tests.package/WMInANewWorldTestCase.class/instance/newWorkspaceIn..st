factory
newWorkspaceIn: aWorld
	| workspace |
	workspace := SystemWindow new
						model: Workspace new; 
						openInWorld: testWorld;
						yourself.  
						
	workspace addMorph: workspace model buildTextMorph.
	^ workspace