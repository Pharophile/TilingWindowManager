"
To test window manager when top window is nil.
"
Class {
	#name : #WMWhenTopWindowIsNilTestCase,
	#superclass : #WMInANewWorldTestCase,
	#category : 'TWM-Tests'
}

{ #category : #running }
WMWhenTopWindowIsNilTestCase >> setUp [
	super setUp.
	SystemWindow passivateTopWindow
]

{ #category : #'move tests' }
WMWhenTopWindowIsNilTestCase >> testTopWindowMoveBottom [
	windowManager topWindowMoveBottom.

]

{ #category : #'move tests' }
WMWhenTopWindowIsNilTestCase >> testTopWindowMoveBottomLeft [
	windowManager topWindowMoveBottomLeft.

]

{ #category : #'move tests' }
WMWhenTopWindowIsNilTestCase >> testTopWindowMoveBottomRight [
	windowManager topWindowMoveBottomRight.

]

{ #category : #'move tests' }
WMWhenTopWindowIsNilTestCase >> testTopWindowMoveLeft [
	windowManager topWindowMoveLeft.

]

{ #category : #'move tests' }
WMWhenTopWindowIsNilTestCase >> testTopWindowMoveRight [
	windowManager topWindowMoveRight.

]

{ #category : #'move tests' }
WMWhenTopWindowIsNilTestCase >> testTopWindowMoveTop [
	windowManager topWindowMoveTop.

]

{ #category : #'move tests' }
WMWhenTopWindowIsNilTestCase >> testTopWindowMoveTopLeft [
	windowManager topWindowMoveTopLeft.

]

{ #category : #'move tests' }
WMWhenTopWindowIsNilTestCase >> testTopWindowMoveTopRight [
	windowManager topWindowMoveTopRight.

]
