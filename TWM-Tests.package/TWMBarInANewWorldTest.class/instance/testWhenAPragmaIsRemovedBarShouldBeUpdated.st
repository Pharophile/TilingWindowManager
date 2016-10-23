tests-pragma-twmButton
testWhenAPragmaIsRemovedBarShouldBeUpdated
	testClassWithButtons class 
			compile: 'buttonTestRunner: aBuilder
		                            aBuilder 
								action: [TestRunner open];
								help: ''test open TestRunner'';
								icon: TestRunner taskbarIcon'.
	self  assert: (self iconicButtonWithTarget: [TestRunner open]) isNil.