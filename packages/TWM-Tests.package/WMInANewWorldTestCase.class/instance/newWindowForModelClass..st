factory
newWindowForModelClass: aClass
	^ SystemWindow new
						model: aClass new; 
						openInWorld: testWorld;
						yourself.  