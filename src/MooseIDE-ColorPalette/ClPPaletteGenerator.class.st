"
I am a generator of palettes. I can generate three types of palettes: 
- a sequential palette
- a diverging palette 
- a qualitative palette: there is a problem with the generation of qualitative palettes. The implemented algorithm is not powerful to generate quite distinct colors, for that you can use the fixed qualitative palette generator. 

Note: The number of colors to generate must be specified using #generate:

To generate a palette use the common method #generate:

Sequential palette:

```Smalltalk
seqPal := ClPPaletteGenerator sequential
	startColor: Color blue endColor: Color red;
	generate: 10 ""generate a gradient of 10 color""	.
seqPal asCollection ""to visualize colors""		
```

Diverging palette:
```Smalltalk
divPal := ClPPaletteGenerator diverging
	s: Color blue m: Color white e: Color red;
	generate: 10 
divPal asCollection 	
```

Qualitative palette:
```Smalltalk
qualPal := ClPPaletteGenerator qualitative
	generate: 10 	.
qualPal asCollection 
```

Fixed qualitative palette:
```Smalltalk
fixedQualPal := ClPPaletteGenerator fixedQualitative
	generate: 10 .
fixedQualPal asCollection 
```

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
ClPPaletteGenerator >> generate: aNumberOfColors [
	
	"return an object of GeneratePalette with the specified number of colors"
	
	numberOfColors := aNumberOfColors .
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
ClPPaletteGenerator >> numberOfColors: anObject [

	numberOfColors := anObject
]
