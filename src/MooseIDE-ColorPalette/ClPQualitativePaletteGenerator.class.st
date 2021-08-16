"
I am the qualitative palette, and I can generate a palette of any number of colors.

In a qualitative palette, the colors assigned to each palette need to be distinct. As a rule of thumb, you should try to limit the maximum palette size. With more colors than 20 you start to run into trouble distinguishing between colors.  


**Example to generate a palette of 10 colors:**
```Smalltalk
p := ClPPaletteGenerator qualitative generate: 10.
p asCollection 
```

**Example to define a level of brightness of the colors to be generated:**
```Smalltalk
p := ClPPaletteGenerator qualitative
	alpha: 0.6; ""for pastel colors""
	generate: 10.
p asCollection 
```
"
Class {
	#name : #ClPQualitativePaletteGenerator,
	#superclass : #ClPPaletteGenerator,
	#instVars : [
		'alpha'
	],
	#category : #'MooseIDE-ColorPalette-PaletteGenerator'
}

{ #category : #accessing }
ClPQualitativePaletteGenerator >> alpha [

	^ alpha ifNil: [ alpha := Random new nextBetween: 0.2 and: 1 ] "Very light colors are not perceptually distinguishable"
]

{ #category : #accessing }
ClPQualitativePaletteGenerator >> alpha: aFloat [

	"take a Float between 0 and 1"
	
	alpha := aFloat
]

{ #category : #private }
ClPQualitativePaletteGenerator >> contrastColorBetween: color1 and: color2 [
	
	"check if color1 and color2 are well contrasted"
	
	| validColor1 validColor2 collection contrastChecker |
	validColor1 := Color colorFrom: color1.
	validColor2 := Color colorFrom: color2.
	collection := OrderedCollection new.
	contrastChecker := ColorContrastChecker new. 
	contrastChecker checkContrastBetween: validColor1 and: validColor2.
	collection 
		add: contrastChecker aaLevelSmallText ;
		add: contrastChecker aaLevelLargeText .
	^ collection allSatisfy: [ :e | e ] 
]

{ #category : #'private-algorithm' }
ClPQualitativePaletteGenerator >> generateADifferentColorFrom: currentColor [

	"generate a different color from the currentColor"

	| nextColor |
	nextColor := self generateRandomColorFrom: currentColor .
	[ self contrastColorBetween: currentColor and: nextColor ] whileFalse: [ 
		nextColor := self generateRandomColorFrom: nextColor ].
	^ nextColor
]

{ #category : #'private-algorithm' }
ClPQualitativePaletteGenerator >> generateRandomColorFrom: aColor [ 

	| red green blue |
	red := Random new nextBetween: 0 and: 255 .
	green := Random new nextBetween: 0 and: 255 .
	blue := Random new nextBetween: 0 and: 255 .
	
	red := (red + aColor red)/2.
	green := (green + aColor green)/2.
	blue := (blue + aColor blue)/2.
	^  Color r: red g: green b: blue alpha: self alpha
]

{ #category : #accessing }
ClPQualitativePaletteGenerator >> makeColors [
	
	^ self qualitative
]

{ #category : #compute }
ClPQualitativePaletteGenerator >> qualitative [

	"returns a collection of distinct colors. The color are generated randomly"

	| colors currentColor |
	colors := OrderedCollection new.
	currentColor := self generateRandomColorFrom: Color white. "white is chosen arbitrary"
	colors add: currentColor.
	2 to: numberOfColors do: [ :i | 
		| nextColor |
		nextColor := self generateADifferentColorFrom: currentColor .
		colors add: nextColor.
		currentColor := nextColor ].
	^ colors
]

{ #category : #compute }
ClPQualitativePaletteGenerator >> spacedValuesBetween: x and: y [

	| step |
	step := (y - x) / (self numberOfColors - 1).
	^ (0 to: self numberOfColors-1) collect: [ :i | x + (step * i) ]
]
