tests-pragma-twmButton
testWhenANewButtonMethodIsAddedTheBarShouldBeUpdated
	classFactory newClass class 
	   compile: 'iWantAButton: aBuilder
							<twmBarButton>
		                            aBuilder 
								action: [1+1]'.
	self deny: (self iconicButtonWithTarget: [1+1]) isNil.