finders
iconicButtonWithTarget: aBlock
	^ self twmBar dock
		findDeepSubmorphThat: [ :aMorph | 
			(aMorph isKindOf: IconicButton)
				and: [ aMorph target asString = aBlock asString and: [ aMorph actionSelector = #value ] ] ]
		ifAbsent: [ nil ]