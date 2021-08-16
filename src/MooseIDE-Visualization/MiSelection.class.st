Class {
	#name : #MiSelection,
	#superclass : #RSInteraction,
	#instVars : [
		'selectionAction',
		'marginPercentage',
		'palette'
	],
	#category : #'MooseIDE-Visualization'
}

{ #category : #'instance creation' }
MiSelection class >> on: selectionAction [
	^ self new
		on: selectionAction;
		yourself
]

{ #category : #initialization }
MiSelection >> initialize [ 

	super initialize .
	palette := MiVisualizationPalette new
]

{ #category : #accessing }
MiSelection >> key [
	^ self class name
]

{ #category : #hooks }
MiSelection >> marginPercentage [
	^ marginPercentage ifNil: [ marginPercentage := 0.05 ]
]

{ #category : #hooks }
MiSelection >> marginPercentage: aFloat [
	marginPercentage := aFloat
]

{ #category : #'instance creation' }
MiSelection >> on: aBlock [
	selectionAction := aBlock
]

{ #category : #hooks }
MiSelection >> onShape: aShape [
	aShape model ifNil: [ ^ self ].
	aShape when: RSMouseClick do: [ self selection: aShape ]
]

{ #category : #accessing }
MiSelection >> palette [

	^ palette
]

{ #category : #hooks }
MiSelection >> putShadowOn: aShape [
	| shadow |
	shadow := RSBox new
		fromRectangle:
			(aShape encompassingRectangle
				expandBy: aShape extent * self marginPercentage);
		paint: self palette highlightSelectedEntity;
		yourself.
	aShape parent addShape: shadow before: aShape.
	aShape topParent propertyAt: self key put: shadow
]

{ #category : #hooks }
MiSelection >> removeShadowOn: aShape [
	aShape topParent
		propertyAt: self key
		ifPresent: [ :shadow |shadow remove ].
]

{ #category : #hooks }
MiSelection >> selection: aShape [
	self
		removeShadowOn: aShape;
		putShadowOn: aShape.
	aShape canvas signalUpdate.
	selectionAction value: aShape model
]
