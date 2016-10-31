I build a button for TWMBar.

You can declare your own custom buttons to be added in the TWMBar using the pragma <twmBarButton>. Just define a class side method like this:

buttonTestRunner: aBuilder
		<twmBarButton>
		aBuilder 
			action: [TestRunner open];
			help: 'test open TestRunner';
			icon: TestRunner taskbarIcon'.