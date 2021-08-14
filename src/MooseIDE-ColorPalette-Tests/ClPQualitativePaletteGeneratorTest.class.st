Class {
	#name : #ClPQualitativePaletteGeneratorTest,
	#superclass : #ClPPaletteGeneratorTest,
	#category : #'MooseIDE-ColorPalette-Tests-PaletteGenerator-Test'
}

{ #category : #accessing }
ClPQualitativePaletteGeneratorTest >> classToTest [ 

	 ^ ClPQualitativePaletteGenerator 
]

{ #category : #tests }
ClPQualitativePaletteGeneratorTest >> testContrastColorBetweenAnd [

	self
		assert: (generator contrastColorBetween: Color black and: Color white)
		equals: true .
	
	self 
		assert: (generator contrastColorBetween: '#112A46' and: '#ACC8E5' )
		equals: true.
		
	self 
		assert: (generator contrastColorBetween: Color yellow and: Color green)
		equals: false .
		
	self 
		assert: (generator contrastColorBetween: Color blue and: Color red )
		equals: false.
		
	self 
		assert: (generator contrastColorBetween: Color magenta and: Color red )
		equals: false
		
]

{ #category : #tests }
ClPQualitativePaletteGeneratorTest >> testQualitative [

	self assert: generator qualitative size equals: self numberOfColors 
]
