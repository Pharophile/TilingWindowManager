Class {
	#name : #TWMBarInANewWorldTest,
	#superclass : #WMInANewWorldTestCase,
	#traits : 'TWMTestHelpers',
	#classTraits : 'TWMTestHelpers classTrait',
	#instVars : [
		'twmBar',
		'classFactory',
		'testClassWithButtons'
	],
	#category : 'TWM-Tests'
}

{ #category : #running }
TWMBarInANewWorldTest >> setUp [
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
]

{ #category : #running }
TWMBarInANewWorldTest >> tearDown [ 
	twmBar close.
	
	"So the pragmas are removed from the real bars (ok, hackish)"
	testClassWithButtons class 
			compile: 'buttonTestRunner: aBuilder';
			compile: 'buttonBrowser: aBuilder';
			compile: 'buttonTranscript: aBuilder'.
	
	classFactory cleanUp.
	super tearDown.
]

{ #category : #'tests-pragma-twmButton' }
TWMBarInANewWorldTest >> testBarShouldContainAButtonToOpenTestRunner [ 
	self deny: (self iconicButtonWithTarget: [TestRunner open]) isNil.
]

{ #category : #'tests-pragma-twmButton' }
TWMBarInANewWorldTest >> testBarShouldContainAButtonToOpenTranscript [
	self deny: (self iconicButtonWithTarget: [Transcript open]) isNil.
]

{ #category : #tests }
TWMBarInANewWorldTest >> testBrowserMenuShouldContainsNewBrowserEntry [
	self assertMenuWithIcon: twmBar browsersMenuIcon containsItemNamed: 'New browser'.
]

{ #category : #tests }
TWMBarInANewWorldTest >> testCustomButtonOrderShouldBeTestRunnerThenTranscriptThenBrowser [
	| testRunnerIndex transcriptIndex browserIndex |
	testRunnerIndex := self twmBar dock allMorphs indexOf: (self iconicButtonWithTarget: [TestRunner open]).
	transcriptIndex := self twmBar dock allMorphs indexOf: (self iconicButtonWithTarget: [Transcript open]).
	browserIndex := self twmBar dock allMorphs indexOf: (self iconicButtonWithTarget: [Browser open]).
	
	self assert: (testRunnerIndex < transcriptIndex).
	self assert: (transcriptIndex < browserIndex).
]

{ #category : #tests }
TWMBarInANewWorldTest >> testMonticelloMenuShouldContainsNewMonticelloBrowserEntry [
	self assertMenuWithIcon: twmBar monticelloMenuIcon containsItemNamed: 'New Monticello browser'.
]

{ #category : #tests }
TWMBarInANewWorldTest >> testRebuildContentAfterAddingAMorphShouldRemoveIt [
	| morph |
	morph := Morph new.
	twmBar dock addMorph: morph.
	self assert: (twmBar dock submorphs includes: morph).
	
	twmBar rebuildDockContent.
	self deny: (twmBar dock submorphs includes: morph).
]

{ #category : #'tests-pragma-twmButton' }
TWMBarInANewWorldTest >> testWhenANewButtonMethodIsAddedTheBarShouldBeUpdated [
	classFactory newClass class 
	   compile: 'iWantAButton: aBuilder
							<twmBarButton>
		                            aBuilder 
								action: [1+1]'.
	self deny: (self iconicButtonWithTarget: [1+1]) isNil.
]

{ #category : #'tests-pragma-twmButton' }
TWMBarInANewWorldTest >> testWhenAPragmaIsRemovedBarShouldBeUpdated [
	testClassWithButtons class 
			compile: 'buttonTestRunner: aBuilder
		                            aBuilder 
								action: [TestRunner open];
								help: ''test open TestRunner'';
								icon: TestRunner taskbarIcon'.
	self  assert: (self iconicButtonWithTarget: [TestRunner open]) isNil.
]

{ #category : #tests }
TWMBarInANewWorldTest >> testWindowsMenuShouldContainsMinimizeAllEntry [
	self assertMenuWithIcon: twmBar windowsIcon containsItemNamed: 'Minimize all windows'.
]

{ #category : #tests }
TWMBarInANewWorldTest >> testWorkspaceMenuShouldContainsNewWorkspaceEntry [
	self assertMenuWithIcon: twmBar workspacesMenuIcon containsItemNamed: 'New workspace'.
]

{ #category : #requirements }
TWMBarInANewWorldTest >> twmBar [
	^ twmBar
]
