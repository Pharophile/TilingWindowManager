layout strategy
layoutStrategy
	LayoutStrategy ifNil: [LayoutStrategy := self defaultLayoutStrategy].
	^ LayoutStrategy.