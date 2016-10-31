assertions
assertMenuWithIcon: aForm containsItemNamed: aString 
	self deny: (self itemNamed: aString fromMenuWithIcon: aForm) isNil.