"
I am a diverging palette generator, and I can make a gradient of 3 colors.

**Instance variables:**
- startingColor: a starting color wich the gradient will begin
- middleColor: a central color which the gradient changes the hue
- endingColor: an ending color wich the gradient will finish
- numberOfColors: a number of colors to make

Example:
```Smalltalk
p := ClPDivergingPaletteGenerator new.
""s: is startingColor, m: is the middleColor, e: is the endingColor""
p s: Color red m: Color white e: Color green; 
	generate: 10 ""generate 10 colors""
```


"
Class {
	#name : #ClPDivergingPaletteGenerator,
	#superclass : #ClPPaletteGenerator,
	#instVars : [
		'startingColor',
		'middleColor',
		'endingColor'
	],
	#category : #'MooseIDE-ColorPalette-PaletteGenerator'
}

{ #category : #accessing }
ClPDivergingPaletteGenerator class >> indexOfTheMiddleColor: aNumberOfColors [

	| index |
	^ index := aNumberOfColors even
		           ifTrue: [ aNumberOfColors // 2 ]
		           ifFalse: [ aNumberOfColors // 2 + 1 ]
]

{ #category : #accessing }
ClPDivergingPaletteGenerator class >> s: startColor m: middleColor e: endColor [

	^ self new s:startColor m:middleColor e:endColor
]

{ #category : #private }
ClPDivergingPaletteGenerator >> calculateRGBStepsBetween: startColor and: endColor [
	
	"calculate RGB steps between startColor and an endColor. Return a collection with the RGB steps"
	
	| collection stepR stepG stepB dividedNumberColors |
	dividedNumberColors := numberOfColors // 2.
	collection := OrderedCollection new.
	stepR := endColor red - startColor red / dividedNumberColors.
	stepG := endColor green - startColor green / dividedNumberColors.
	stepB := endColor blue - startColor blue / dividedNumberColors.
	collection 
			add: stepR value; 
			add: stepG value; 	
			add: stepB value.
	^ collection
]

{ #category : #initialization }
ClPDivergingPaletteGenerator >> initialize [ 

	super initialize .
	middleColor := Color white

]

{ #category : #accessing }
ClPDivergingPaletteGenerator >> makeColors [

	^ self multiHueGradient 
]

{ #category : #accessing }
ClPDivergingPaletteGenerator >> multiHueGradient [
	
	"create a multi hue gradient colors between startColor, middleColor and an endColor"
	
	| colors stepsRGB1 stepsRGB2 indexMiddleColor |
	stepsRGB1 := self calculateRGBStepsBetween: startingColor and: middleColor .
	stepsRGB2 := self calculateRGBStepsBetween: middleColor and: endingColor .
	indexMiddleColor := self class indexOfTheMiddleColor: numberOfColors.
	colors := OrderedCollection new.
	colors add: startingColor.
	2 to: numberOfColors - 1 do: [ :i | 
		i < indexMiddleColor ifTrue: [ 
			colors add: (Color
					 r: colors last red + stepsRGB1 first
					 g: colors last green + stepsRGB1 second
					 b: colors last blue + stepsRGB1 last) ].
		i = indexMiddleColor ifTrue: [ colors add: middleColor ].
		i > indexMiddleColor ifTrue: [ 
			colors add: (Color
					 r: colors last red + stepsRGB2 first
					 g: colors last green + stepsRGB2 second
					 b: colors last blue + stepsRGB2 last) ] ].
	colors add: endingColor.
	^ colors
]

{ #category : #accessing }
ClPDivergingPaletteGenerator >> s: aStartingColor e: anEndingcolor [
	
	startingColor := Color colorFrom: aStartingColor .
	endingColor := Color colorFrom: anEndingcolor 
]

{ #category : #accessing }
ClPDivergingPaletteGenerator >> s: aStartingColor m: aMiddleColor e: anEndingColor [

	self s: aStartingColor e: anEndingColor .
	middleColor := Color colorFrom: aMiddleColor.
	
]
