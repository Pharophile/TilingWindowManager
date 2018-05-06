"
I define useful method to search submorphs of TWMBar for testing
"
Trait {
	#name : #TWMTestHelpers,
	#category : 'TWM-Tests'
}

{ #category : #assertions }
TWMTestHelpers >> assertMenuWithIcon: aForm containsItemNamed: aString [ 
	self deny: (self itemNamed: aString fromMenuWithIcon: aForm) isNil.
]

{ #category : #finders }
TWMTestHelpers >> iconicButtonWithTarget: aBlock [
	^ self twmBar dock
		findDeepSubmorphThat: [ :aMorph | 
			(aMorph isKindOf: IconicButton)
				and: [ aMorph target asString = aBlock asString and: [ aMorph actionSelector = #value ] ] ]
		ifAbsent: [ nil ]
]

{ #category : #finders }
TWMTestHelpers >> itemNamed:aString fromMenu: aMenu [
	self twmBar dock activeSubmenu: aMenu subMenu.
	^ aMenu subMenu allMorphs detect: [:aMorph| (aMorph isKindOf: MenuItemMorph)  
														and:[aMorph contents =  aString]].
	
]

{ #category : #finders }
TWMTestHelpers >> itemNamed:aString fromMenuWithIcon: aForm [
	^  self itemNamed: aString fromMenu: (self menuWithIcon: aForm).
]

{ #category : #finders }
TWMTestHelpers >> menuWithIcon: aForm [
	^ self twmBar dock
						findDeepSubmorphThat: [:aMorph|  
								(aMorph isKindOf: MenuItemMorph)  and:[aMorph icon =  aForm]]
						ifAbsent: [nil].
]

{ #category : #requirements }
TWMTestHelpers >> twmBar [
	self explicitRequirement
]
