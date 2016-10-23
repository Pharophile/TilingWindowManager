initialization
initializeGroupWindowMorph
	groupWindowMorph := GroupWindowMorph new.
	groupWindowMorph color: Color black.
	self
		addMorph: groupWindowMorph 
		fullFrame: (LayoutFrame fractions: (0@0 corner: 1@1))