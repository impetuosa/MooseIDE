Class {
	#name : #PaletteTest,
	#superclass : #TestCase,
	#instVars : [
		'emptyPalette',
		'nonEmptyPalette'
	],
	#category : #'MooseIDE-ColorPalette-Tests-Palette-Test'
}

{ #category : #testing }
PaletteTest class >> isAbstract [ 
	
	^ self == PaletteTest 
]

{ #category : #accessing }
PaletteTest >> classToTest [ 

	^ self subclassResponsibility 
]

{ #category : #accessing }
PaletteTest >> colors [

	^ { Color white. Color black. Color red }
]

{ #category : #running }
PaletteTest >> setUp [
	
	super setUp.
	emptyPalette := self classToTest new.
	nonEmptyPalette := self classToTest withAll: self colors
	
]

{ #category : #tests }
PaletteTest >> testReplaceColorAtWith [
	
	| newColor replacedColor |
	newColor := Color green.
	replacedColor := nonEmptyPalette replaceColorAt: 1 with: newColor .
	self assert: replacedColor equals: newColor .
	self assert: nonEmptyPalette asCollection first equals: newColor .
	

]
