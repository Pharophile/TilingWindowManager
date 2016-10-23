border-styles
tabPanelBorderStyleFor: aTabGroup
	^ StandardTabPanelBorder new 
		width: 1;
		baseColor: ((self baseDarkColorFor: aTabGroup));
		tabSelector: aTabGroup tabSelectorMorph