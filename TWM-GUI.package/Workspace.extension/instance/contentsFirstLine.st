*twm-gui
contentsFirstLine

	| lines textMorph|
	self flag: #TODO. "Works with old workspace, not so well with Playgrounds. To fix."
	textMorph := self dependents detect: [:c | c isKindOf: PluggableTextMorph] ifNone: [nil].
	^ textMorph 
		ifNotNil: [	lines := textMorph text asString lines.
					lines ifEmpty: [''] ifNotEmpty: [lines first]  ]
		ifNil: [''].