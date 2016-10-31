tests
testCustomButtonOrderShouldBeTestRunnerThenTranscriptThenBrowser
	| testRunnerIndex transcriptIndex browserIndex |
	testRunnerIndex := self twmBar dock allMorphs indexOf: (self iconicButtonWithTarget: [TestRunner open]).
	transcriptIndex := self twmBar dock allMorphs indexOf: (self iconicButtonWithTarget: [Transcript open]).
	browserIndex := self twmBar dock allMorphs indexOf: (self iconicButtonWithTarget: [Browser open]).
	
	self assert: (testRunnerIndex < transcriptIndex).
	self assert: (transcriptIndex < browserIndex).