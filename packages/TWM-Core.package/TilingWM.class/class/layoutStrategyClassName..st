layout strategy
layoutStrategyClassName: strategyClassName
	LayoutStrategy := (Smalltalk at: strategyClassName ifAbsent: self defaultLayoutStrategy).