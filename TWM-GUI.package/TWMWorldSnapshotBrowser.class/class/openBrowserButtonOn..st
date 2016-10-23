buttons
openBrowserButtonOn: aBuilder
	<twmBarButton>
	aBuilder 
		action: [self open];
		icon: self icons tinyMenuIcon;
		help: 'Browse world snapshots'.