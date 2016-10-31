private
normalFillStyleFor: aMorph height: anInteger
	"Return the normal button fillStyle for the given button."
	
	| baseColor |
	baseColor := self baseColorFor: aMorph.
	^ self normalFillStyleWithBaseColor: baseColor for: aMorph height: anInteger
