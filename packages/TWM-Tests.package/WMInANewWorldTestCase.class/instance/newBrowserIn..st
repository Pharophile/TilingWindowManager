factory
newBrowserIn: aWorld
	^ SystemWindow new
						model: Browser new; 
						openInWorld: testWorld;
						yourself.  