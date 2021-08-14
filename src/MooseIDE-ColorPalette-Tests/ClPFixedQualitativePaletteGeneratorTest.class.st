Class {
	#name : #ClPFixedQualitativePaletteGeneratorTest,
	#superclass : #ClPPaletteGeneratorTest,
	#category : #'MooseIDE-ColorPalette-Tests-PaletteGenerator-Test'
}

{ #category : #accessing }
ClPFixedQualitativePaletteGeneratorTest >> classToTest [ 

	 ^ ClPFixedQualitativePaletteGenerator  
]

{ #category : #tests }
ClPFixedQualitativePaletteGeneratorTest >> testFromColorsGet [

	| colors extractedColors |
	colors := { Color red. Color blue. Color white. Color black }.
	extractedColors := generator fromColors: colors get: 3.
	self assert: extractedColors size equals: 3.
	1 to: extractedColors size do: [ :i | 
	self assert: (extractedColors at: 1) equals: (colors at: 1) ]
]
