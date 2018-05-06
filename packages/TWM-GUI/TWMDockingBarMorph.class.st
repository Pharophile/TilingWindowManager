"
I'm a DockingBar that dynamically update its submenus when they are opened

"
Class {
	#name : #TWMDockingBarMorph,
	#superclass : #DockingBarMorph,
	#category : 'TWM-GUI'
}

{ #category : #control }
TWMDockingBarMorph >> activeSubmenu: aSubmenu [
	"This is where submenus get automagically updated"
	(aSubmenu notNil and: [ aSubmenu respondsTo: #updateMenu]) ifTrue: [aSubmenu updateMenu].
	super activeSubmenu: aSubmenu.
]

{ #category : #accessing }
TWMDockingBarMorph >> icons [
	^Smalltalk ui icons
]
