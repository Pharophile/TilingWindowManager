tests-pragma-twmButton
testBarShouldContainAButtonToOpenTranscript
	self deny: (self iconicButtonWithTarget: [Transcript open]) isNil.