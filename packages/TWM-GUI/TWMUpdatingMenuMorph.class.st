"
A menu updating itself
"
Class {
	#name : #TWMUpdatingMenuMorph,
	#superclass : #DockingBarMenuMorph,
	#instVars : [
		'updater',
		'updateSelector'
	],
	#category : 'TWM-GUI'
}

{ #category : #update }
TWMUpdatingMenuMorph >> updateMenu [
	"Reconstitute the menu by first removing the contents and then building it afresh"
	self flag: #TODO. "Reinstate this feature once we figure out why it crashes"
	
	self removeAllMorphs.
	updater perform: updateSelector with: self


]

{ #category : #initialization }
TWMUpdatingMenuMorph >> updater: anObject updateSelector: aSelector [
	"Set the receiver's updater and updateSelector"

	updater := anObject.
	updateSelector := aSelector
]
