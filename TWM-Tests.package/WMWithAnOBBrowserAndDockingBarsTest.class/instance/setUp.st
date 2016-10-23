running
setUp
	super setUp.
	
	obbrowser :=  self newWindowFor:  #OBSystemBrowser.
	
	taskBar := TaskbarMorph new 
					openInWorld: testWorld;
					adhereToEdge: #bottom.
	
	leftBar := DockingBarMorph new 
						adhereToLeft;
						width: 25;
						openInWorld: testWorld.