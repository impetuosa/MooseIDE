Class {
	#name : #ClPPaletteGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator'
	],
	#category : #'MooseIDE-ColorPalette-Tests-PaletteGenerator-Test'
}

{ #category : #testing }
ClPPaletteGeneratorTest class >> isAbstract [ 
	
	^ self == ClPPaletteGeneratorTest
]

{ #category : #accessing }
ClPPaletteGeneratorTest >> classToTest [ 

	 ^ self subclassResponsibility 
]

{ #category : #accessing }
ClPPaletteGeneratorTest >> numberOfColors [ 
	
	^ 10
]

{ #category : #initialization }
ClPPaletteGeneratorTest >> setUp [ 

	generator := self classToTest new numberOfColors: self numberOfColors .
]

{ #category : #tests }
ClPPaletteGeneratorTest >> testGenerate [
	
	| generatedPalette |
	generatedPalette := generator generate: self numberOfColors .
	self assert:  generatedPalette asCollection size equals: self numberOfColors  
]
