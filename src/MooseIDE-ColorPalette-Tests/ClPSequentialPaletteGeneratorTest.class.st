Class {
	#name : #ClPSequentialPaletteGeneratorTest,
	#superclass : #ClPPaletteGeneratorTest,
	#category : #'MooseIDE-ColorPalette-Tests-PaletteGenerator-Test'
}

{ #category : #accessing }
ClPSequentialPaletteGeneratorTest >> classToTest [ 

	 ^ ClPSequentialPaletteGenerator  
]

{ #category : #running }
ClPSequentialPaletteGeneratorTest >> setUp [
	super setUp.
	generator startColor: Color red endColor: Color blue
]

{ #category : #tests }
ClPSequentialPaletteGeneratorTest >> testGradient [

	self assert: generator gradient size equals: self numberOfColors .
	self assert: generator gradient first equals: Color red.
	self assert: generator gradient last equals: Color blue
]
