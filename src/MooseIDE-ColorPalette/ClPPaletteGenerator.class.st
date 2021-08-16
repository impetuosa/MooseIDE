"
I am a generator of palettes. 
Note: The number of colors to generate must be specified, the default value is 20

To generate a palette use the common method #generate:


"
Class {
	#name : #ClPPaletteGenerator,
	#superclass : #Object,
	#instVars : [
		'numberOfColors',
		'generatedPalette'
	],
	#category : #'MooseIDE-ColorPalette-PaletteGenerator'
}

{ #category : #'instance creation' }
ClPPaletteGenerator class >> diverging [

	^ ClPDivergingPaletteGenerator new
]

{ #category : #'instance creation' }
ClPPaletteGenerator class >> fixedQualitative [

	^ ClPFixedQualitativePaletteGenerator new
]

{ #category : #translating }
ClPPaletteGenerator class >> generate: aNumberOfColors [

	^ self new generate: aNumberOfColors 
]

{ #category : #testing }
ClPPaletteGenerator class >> isAbstract [
	
	^ self == ClPPaletteGenerator 
]

{ #category : #'instance creation' }
ClPPaletteGenerator class >> qualitative [ 

	^ ClPQualitativePaletteGenerator new
]

{ #category : #'instance creation' }
ClPPaletteGenerator class >> sequential [ 

	^ ClPSequentialPaletteGenerator new
]

{ #category : #generating }
ClPPaletteGenerator >> generate [

	"generate 20 colors by default"

	^ self generate: self numberOfColors
]

{ #category : #generating }
ClPPaletteGenerator >> generate: aNumberOfColors [
	
	"return an object of GeneratePalette with the specified number of colors"
	
	self numberOfColors: aNumberOfColors .
	^ generatedPalette class withAll: self makeColors
	
	
]

{ #category : #accessing }
ClPPaletteGenerator >> generatedPalette [

	^ generatedPalette
]

{ #category : #'gt-inspection' }
ClPPaletteGenerator >> gtInspectorColorsIn: composite [
	<gtInspectorPresentationOrder: 0>
	
	^ composite fastTable
		title: 'Colors';
		display: [ self generate asCollection ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Index' evaluated: [ :color :idex | idex asString ] width: 50;
		column: 'Color' evaluated: [ :color | BorderedMorph new color: color ] width: 52;
		column: 'Code' evaluated: [ :color | GTObjectPrinter asTruncatedTextFrom: color asHexString asLowercase asSymbol ];
		send: [ :result | 
			result
				ifNil: [ nil ]
				ifNotNil: [ result size = 1
						ifTrue: [ result anyOne ]
						ifFalse: [ self species withAll: result ]
					]
			]
]

{ #category : #initialization }
ClPPaletteGenerator >> initialize [ 
	
	super initialize .
	generatedPalette := GeneratedPalette new
]

{ #category : #accessing }
ClPPaletteGenerator >> makeColors [

	^ self subclassResponsibility  
]

{ #category : #accessing }
ClPPaletteGenerator >> numberOfColors [

	^ numberOfColors
]

{ #category : #accessing }
ClPPaletteGenerator >> numberOfColors: anInteger [

	numberOfColors := anInteger  
]
