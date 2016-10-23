running
setUp
	super setUp.
	classFactory := ClassFactoryForTestCase new.
	testClassWithButtons := classFactory newClass.
	testClassWithButtons class 
			compile: 'buttonTestRunner: aBuilder
							<twmBarButton>
		                            aBuilder 
								action: [TestRunner open];
								help: ''test open TestRunner'';
								icon: TestRunner taskbarIcon';
			compile: 'buttonBrowser: aBuilder
							<twmBarButton>
		                            aBuilder 
								action: [Browser open];
								help: ''test open Browser'';
								priority: 100';
			compile: 'buttonTranscript: aBuilder
							<twmBarButton>
		                            aBuilder 
								action: [Transcript open];
								help: ''test open Transcript'';
								priority: 5'.
	twmBar := TWMBar new openInWorld: testWorld. 