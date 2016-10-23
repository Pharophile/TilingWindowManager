running
tearDown 
	twmBar close.
	
	"So the pragmas are removed from the real bars (ok, hackish)"
	testClassWithButtons class 
			compile: 'buttonTestRunner: aBuilder';
			compile: 'buttonBrowser: aBuilder';
			compile: 'buttonTranscript: aBuilder'.
	
	classFactory cleanUp.
	super tearDown.