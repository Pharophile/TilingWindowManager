running
setUp
	super setUp.
	twmBar := TWMBar new openInWorld: testWorld. 
	browser1 model setClass: Boolean selector: nil.
	browser2 model setClass: String selector: nil. 

	workspace2 model contents: 'I am a Workspace with a very long first line. So long, that it would mess up the layout of the TWMBar Menu. So we make sure it gets cut.'.