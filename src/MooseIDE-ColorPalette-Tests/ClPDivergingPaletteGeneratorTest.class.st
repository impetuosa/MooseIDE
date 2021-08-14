Class {
	#name : #ClPDivergingPaletteGeneratorTest,
	#superclass : #ClPPaletteGeneratorTest,
	#category : #'MooseIDE-ColorPalette-Tests-PaletteGenerator-Test'
}

{ #category : #accessing }
ClPDivergingPaletteGeneratorTest >> classToTest [ 

	 ^ ClPDivergingPaletteGenerator 
]

{ #category : #running }
ClPDivergingPaletteGeneratorTest >> setUp [
	super setUp.
	generator s: Color blue m: Color white e: Color red
]

{ #category : #tests }
ClPDivergingPaletteGeneratorTest >> testMultiHueGradient [
	
	| gradientColors |
	gradientColors := generator multiHueGradient .
	self assert: gradientColors size equals: self numberOfColors .
	self assert: gradientColors first equals: Color blue.
	self assert: (gradientColors at: gradientColors size//2) equals: Color white.
	self assert: gradientColors last equals: Color red.
]

{ #category : #tests }
ClPDivergingPaletteGeneratorTest >> testcalculateRGBStepsBetweenAnd [

	| rgbSteps |
	rgbSteps := generator calculateRGBStepsBetween: Color red and: Color red.
	rgbSteps do: [ :e | self assert: e equals: 0 ].
	
	rgbSteps := generator calculateRGBStepsBetween: Color red and: Color blue.
	self assert: rgbSteps equals: #(-0.2 0.0 0.2) asOrderedCollection 
]
