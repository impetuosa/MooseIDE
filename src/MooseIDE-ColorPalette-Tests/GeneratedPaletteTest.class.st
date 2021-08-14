Class {
	#name : #GeneratedPaletteTest,
	#superclass : #PaletteTest,
	#category : #'MooseIDE-ColorPalette-Tests-Palette-Test'
}

{ #category : #accessing }
GeneratedPaletteTest >> classToTest [ 

	^ GeneratedPalette 
]

{ #category : #tests }
GeneratedPaletteTest >> testAdd [
	
	| c1 c2 |
	c1 := Color green.
	c2 := Color brown.
	
	self assert: emptyPalette asCollection isEmpty.

	emptyPalette add: c1.
	self assert: emptyPalette asCollection size equals: 1.
	self assert: (emptyPalette colorAt: 1) equals: c1.
	emptyPalette add: c2.
	self assert: emptyPalette asCollection size equals: 2.
	self assert: (emptyPalette colorAt: 2) equals: c2.
]

{ #category : #tests }
GeneratedPaletteTest >> testAddNameForColor [
	
	self assert: emptyPalette asCollection isEmpty.
	
	emptyPalette addName: #pink forColor: Color pink.
	self assert: emptyPalette asCollection size equals: 1.
	self assert: (emptyPalette colorsDictionary includesAssociation: #pink -> Color pink).
	
	
]

{ #category : #tests }
GeneratedPaletteTest >> testCheckAllElementsAreColors [
	
	self assert: (nonEmptyPalette class checkAllElementsAreColors: nonEmptyPalette asCollection). 
]

{ #category : #tests }
GeneratedPaletteTest >> testCurrentColor [
	
	| aChosenColor |
	self assert: nonEmptyPalette currentColor equals: nonEmptyPalette first .
	aChosenColor := nonEmptyPalette colorAt: 2.
	self assert: nonEmptyPalette currentColor equals: aChosenColor  
]

{ #category : #tests }
GeneratedPaletteTest >> testNextColor [
	
	| aChosenColor |
	self assert: nonEmptyPalette currentColor equals: nonEmptyPalette first .
	self assert: nonEmptyPalette nextColor equals: nonEmptyPalette second.
	
	aChosenColor := nonEmptyPalette colorAt: 2.
	self assert: nonEmptyPalette currentColor equals: aChosenColor .
	self assert: nonEmptyPalette nextColor equals: nonEmptyPalette third.
	
	aChosenColor := nonEmptyPalette last.
	self assert: nonEmptyPalette currentColor equals: aChosenColor .
	self assert: nonEmptyPalette nextColor equals: nonEmptyPalette first 
]

{ #category : #tests }
GeneratedPaletteTest >> testPreviousColor [
	
	| colorSelected |
	self assert: nonEmptyPalette currentColor equals: self colors first .
	self assert: nonEmptyPalette previousColor equals: self colors last.
	
	colorSelected := nonEmptyPalette colorAt: 2.
	self assert: nonEmptyPalette currentColor equals: self colors second .
	self assert: nonEmptyPalette previousColor equals: self colors first
]

{ #category : #tests }
GeneratedPaletteTest >> testWithAll [

	| palette colorsDict indexColor |
	palette := self classToTest withAll: self colors.
	colorsDict := palette colorsDictionary.
	self assert: colorsDict size equals: self colors size.
	indexColor := 1.
	colorsDict associationsDo: [ :each | 
		self
			assert: (colorsDict associationAt: each key)
			equals: indexColor -> (self colors at: indexColor).
		indexColor := indexColor + 1 ]
]
