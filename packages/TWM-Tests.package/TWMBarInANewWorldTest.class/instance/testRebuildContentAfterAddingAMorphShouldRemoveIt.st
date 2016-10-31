tests
testRebuildContentAfterAddingAMorphShouldRemoveIt
	| morph |
	morph := Morph new.
	twmBar dock addMorph: morph.
	self assert: (twmBar dock submorphs includes: morph).
	
	twmBar rebuildDockContent.
	self deny: (twmBar dock submorphs includes: morph).