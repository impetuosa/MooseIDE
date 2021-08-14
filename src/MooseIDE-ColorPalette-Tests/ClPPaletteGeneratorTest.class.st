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

	generator := self classToTest new numberOfColors: self numberOfColors
]

{ #category : #tests }
ClPPaletteGeneratorTest >> testGenerate [

	self assert: generator generate asCollection size equals: self numberOfColors  
]
