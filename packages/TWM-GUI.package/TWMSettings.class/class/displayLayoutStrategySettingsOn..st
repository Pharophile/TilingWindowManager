settings
displayLayoutStrategySettingsOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #layoutStrategyClassName) 
		label: 'Layout strategy' translated;
		target: TilingWM;
		parent: #twm;
		order: 2;
		description: 'Layout strategy to tile windows' translated;
		default: #TWMHorizontalLayoutStrategy;
		domainValues: (TWMLayoutStrategy subclasses collect: [:aClass| (aClass strategyName) -> aClass name]).