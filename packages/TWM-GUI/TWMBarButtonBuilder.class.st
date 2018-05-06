"
I build a button for TWMBar.

You can declare your own custom buttons to be added in the TWMBar using the pragma <twmBarButton>. Just define a class side method like this:

buttonTestRunner: aBuilder
		<twmBarButton>
		aBuilder 
			action: [TestRunner open];
			help: 'test open TestRunner';
			icon: TestRunner taskbarIcon'.
"
Class {
	#name : #TWMBarButtonBuilder,
	#superclass : #Object,
	#instVars : [
		'button',
		'priority'
	],
	#category : 'TWM-GUI'
}

{ #category : #accessing }
TWMBarButtonBuilder >> action: aBlock [
	self button
		target: aBlock;
		actionSelector: #value.
]

{ #category : #accessing }
TWMBarButtonBuilder >> button [
	^ button ifNil: [button := IconicButton new color: Color transparent].
]

{ #category : #accessing }
TWMBarButtonBuilder >> help: aString [
	self button setBalloonText: aString
]

{ #category : #accessing }
TWMBarButtonBuilder >> icon: aForm [
	self button labelGraphic: aForm
]

{ #category : #accessing }
TWMBarButtonBuilder >> priority [
	^ priority ifNil: [priority := 0].
]

{ #category : #accessing }
TWMBarButtonBuilder >> priority: aSmallInteger [
	priority := aSmallInteger
]
