"
I am a fixed qualitative palette generator. I can extract colors from predefined qualitative palettes. The extracted colors are all distinct.

**Note: You can choose until 60 colors**

Example:
```Smalltalk
ClPPaletteGenerator fixedQualitative
	generate: 10  ""generate a palette of 10 colors from a predefined collection of colors""
```
"
Class {
	#name : #ClPFixedQualitativePaletteGenerator,
	#superclass : #ClPQualitativePaletteGenerator,
	#category : #'MooseIDE-ColorPalette-PaletteGenerator'
}

{ #category : #examples }
ClPFixedQualitativePaletteGenerator class >> example10PastelColors [

	self sample10PastelColors asCollection inspect
]

{ #category : #examples }
ClPFixedQualitativePaletteGenerator class >> example12PairedColors [
	
	self sample12PairedColors asCollection inspect
	
]

{ #category : #examples }
ClPFixedQualitativePaletteGenerator class >> example15Colors [

	^ self sample15Colors asCollection inspect
]

{ #category : #examples }
ClPFixedQualitativePaletteGenerator class >> example16AccentColors [

	self sample16AccentColors asCollection inspect
]

{ #category : #examples }
ClPFixedQualitativePaletteGenerator class >> example20AccentColors [

	self sample20AccentColors asCollection inspect
]

{ #category : #examples }
ClPFixedQualitativePaletteGenerator class >> example24AccentColors [

	self sample24AccentColors asCollection inspect
]

{ #category : #examples }
ClPFixedQualitativePaletteGenerator class >> example60AccentColors [
	
	self sample60AccentColors asCollection inspect
]

{ #category : #samples }
ClPFixedQualitativePaletteGenerator class >> sample10PastelColors [

	| colors |
	colors := #( 'BC0A59' '3DE2F1' 'AC8E30' '01CC65' '7E3BD2' '271FF7'
	             '993300' '33B6F1' 'C9E000' '6B6386' ).
	^ self new generatedPalette class withAll:
		  (colors collect: [ :e | (Color fromString: e) alpha: 0.6 ])
]

{ #category : #samples }
ClPFixedQualitativePaletteGenerator class >> sample12PairedColors [
	
	| colors |
	colors := #('#accbe1' '#4075b0' '#b8dc8e' '#539c3b' '#ed9e99' '#cf3f29' '#f3c075' '#ee8629' '#c5b1d3' '#654396' '#fefca0' '#a45f33' ).
	^ self new generatedPalette class withAll: (colors collect: [ :e | Color fromString: e])
	
]

{ #category : #samples }
ClPFixedQualitativePaletteGenerator class >> sample15Colors [

	^ self new generatedPalette class withAll: { 
			  (Color fromString: '#d4ac0d').
			  (Color fromString: '#875692').
			  (Color fromString: '#f38400').
			  (Color fromString: '#a1caf1').
			  (Color fromString: '#be0032').
			  (Color fromString: '#008856').
			  (Color fromString: '#e68fac').
			  (Color fromString: '#0067a5').
			  (Color fromString: '#f99379').
			  (Color fromString: '#c2b280').
			  (Color fromString: '#873600').
			  (Color fromString: '#8db600').
			  (Color fromString: '#f7dc6f').
			  (Color fromString: '#48c9b0').
			  (Color fromString: '#ff5050') }
]

{ #category : #samples }
ClPFixedQualitativePaletteGenerator class >> sample16AccentColors [

	^ self new generatedPalette class withAll: { 
			  (Color fromString: '#7a7377').
			  (Color fromString: '#875692').
			  (Color fromString: '#f38400').
			  (Color fromString: '#a1caf1').
			  (Color fromString: '#be0032').
			  (Color fromString: '#008856').
			  (Color fromString: '#e68fac').
			  (Color fromString: '#0067a5').
			  (Color fromString: '#D17B65').
			  (Color fromString: '#c2b280').
			  (Color fromString: '#873600').
			  (Color fromString: '#8db600').
			  (Color fromString: '#ffffff').
			  (Color fromString: '#48c9b0').
			  (Color fromString: '#ff5050').
			  (Color fromString: '#000000')}
]

{ #category : #samples }
ClPFixedQualitativePaletteGenerator class >> sample20AccentColors [

	^ self new generatedPalette class withAll: { 
			  (Color fromString: '#ff00b6').
			  (Color fromString: '#009fff').
			  (Color fromString: '#BD8A83').
			  (Color fromString: '#00ffbe').
			  (Color fromString: '#783fc1').
			  (Color fromString: '#1fb5b8').
			  (Color fromString: '#ffacfd').
			  (Color fromString: '#b1cc71').
			  (Color fromString: '#de7693').
			  (Color fromString: '#c8ff00').
			  (Color fromString: '#ff9952').
			  (Color fromString: '#93d4ff').
			  (Color fromString: '#004cff').
			  (Color fromString: '#84e19f').
			  (Color fromString: '#f7ba9e').
			  (Color fromString: '#a3cbcc').
			  (Color fromString: '#a779e0').
			  (Color fromString: '#978fa1').
			  (Color fromString: '#E6CF67').
			  (Color fromString: '#b09900') }
]

{ #category : #samples }
ClPFixedQualitativePaletteGenerator class >> sample24AccentColors [

	^ self new generatedPalette class withAll: { 
			  (Color fromString: '#ACA8AA').
			  (Color fromString: '#bbc9d9').
			  (Color fromString: '#ff4d57').
			  (Color fromString: '#AE7190').
			  (Color fromString: '#3283fe').
			  (Color fromString: '#feaf16').
			  (Color fromString: '#e342a1').
			  (Color fromString: '#1CD8AF').
			  (Color fromString: '#2bc6e8').
			  (Color fromString: '#dea0fd').
			  (Color fromString: '#aa0dfe').
			  (Color fromString: '#f8a19f').
			  (Color fromString: '#325a9b').
			  (Color fromString: '#d97238').
			  (Color fromString: '#469a75').
			  (Color fromString: '#85660d').
			  (Color fromString: '#61d485').
			  (Color fromString: '#f7e1a0').
			  (Color fromString: '#a779e0').
			  (Color fromString: '#978fa1').
			  (Color fromString: '#3b00fb').
			  (Color fromString: '#b09900').
			  (Color fromString: '#fbe426').
			  (Color fromString: '#ed0000') }
]

{ #category : #samples }
ClPFixedQualitativePaletteGenerator class >> sample60AccentColors [
	
	| allColors |
	allColors := OrderedCollection new .
	allColors 
		addAll: self sample16AccentColors asCollection ;
	 	addAll: self sample20AccentColors asCollection ;
		addAll: self sample24AccentColors asCollection . 
	^ self new generatedPalette class withAll: allColors 
			
]

{ #category : #'instance creation' }
ClPFixedQualitativePaletteGenerator >> fromColors: aCollectionOfColors get: aNumberOfColors [

	"extract first colors aNumberOfColors from a predefined palette"

	^ aCollectionOfColors copyFrom: 1 to: aNumberOfColors
]

{ #category : #initialization }
ClPFixedQualitativePaletteGenerator >> initialize [ 

	super initialize .
	numberOfColors := 15
]

{ #category : #accessing }
ClPFixedQualitativePaletteGenerator >> makeColors [
	
	self numberOfColors
	> self class sample60AccentColors asCollection size ifTrue: [ 
		Error signal: 'Maximum number of colors to choose is 60' ].
	^ self
		  fromColors: self class sample60AccentColors asCollection
		  get: self numberOfColors
]
