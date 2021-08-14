"
I am a ColorContrastCheck, I check if two colors are well contrasted.
I calculate the contrast ratio of text and background colors.
My algorithms are taken from https://www.w3.org/TR/WCAG21/

There are two levels that define the requirements for having a good contrast between the color of the text and the whole theme:
- AA-level: continuing with the theme of color, you have to ensure that all the text meets color contrast requirements. The requirement differs somewhat based on the size of the text, but it is actually pretty strict.
- AAA-level: the requirement is taken further with an even more strict color contrast requirement for text. Essentially you can only use very dark colors on a very light background and vice versa. Almost all colored text fails.

**Example:** 

```Smalltalk
ColorContrastChecker 
		checkContrastBetween: Color white and: Color black
```
will print: 
""a ColorContrastChecker
AA-level large text: true
AA-level small text: true
AAA-level large text: true
AAA-level small text: true""

The value true means that the two chosen colors are well contrasted.
The value false means that the two chosen colors are not contrasted.

In the example the two colors(black and white) are very contrasted each other
"
Class {
	#name : #ColorContrastChecker,
	#superclass : #Object,
	#instVars : [
		'firstColor',
		'secondColor'
	],
	#category : #'MooseIDE-ColorPalette-Helper'
}

{ #category : #'instance creation' }
ColorContrastChecker class >> checkContrastBetween: firstColor and: secondColor [
	
	^ self new
		  checkContrastBetween: firstColor and: secondColor ;
		  yourself 
]

{ #category : #default }
ColorContrastChecker class >> defaultAAALargeTextThreshold [

	^ 1/4.5
]

{ #category : #default }
ColorContrastChecker class >> defaultAAASmallTextThreshold [

	^ 1/7
]

{ #category : #default }
ColorContrastChecker class >> defaultAALargeTextThreshold [

	^ 1/3
]

{ #category : #default }
ColorContrastChecker class >> defaultAASmallTextThreshold [

	^ 1/4.5
]

{ #category : #accessing }
ColorContrastChecker >> aaLevelLargeText [

	 ^ self wcagMeasurement: self class defaultAALargeTextThreshold
]

{ #category : #accessing }
ColorContrastChecker >> aaLevelSmallText [

	^ self wcagMeasurement: self class defaultAASmallTextThreshold
]

{ #category : #accessing }
ColorContrastChecker >> aaaLevelLargeText [

	^ self wcagMeasurement: self class defaultAAALargeTextThreshold
]

{ #category : #accessing }
ColorContrastChecker >> aaaLevelSmallText [

	^ self wcagMeasurement: self class defaultAAASmallTextThreshold
]

{ #category : #algorithm }
ColorContrastChecker >> calculateColorLuminanceR: rComponent g: gComponent b: bComponent [
	
	"Algorithm taken from https://www.w3.org/TR/WCAG21/#contrast-minimum"
	
	| a |
	a := { rComponent . gComponent . bComponent } collect: [ :v | 
		 v <= 0.03928 
			ifTrue: [ v / 12.92 ] 
			ifFalse: [ ((v + 0.055) / 1.055) raisedTo: 2.4 ] ].
	^ ((a first) * 0.2126) + ((a second) * 0.7152) + ((a third) * 0.0722)
]

{ #category : #algorithm }
ColorContrastChecker >> checkContrast [
	
	"Algorithm taken from https://www.w3.org/TR/WCAG21/#contrast-minimum"
	
	| color1RGB color2RGB color1Luminance color2Luminance |
	color1RGB := self firstColor rgbTriplet.
	color2RGB := self secondColor rgbTriplet.
	color1Luminance := self
		                   calculateColorLuminanceR: color1RGB first
		                   g: color1RGB second
		                   b: color1RGB third.
	color2Luminance := self
		                   calculateColorLuminanceR: color2RGB first
		                   g: color2RGB second
		                   b: color2RGB third.
	^ self contrastRatioBetween: color1Luminance and: color2Luminance  
]

{ #category : #accessing }
ColorContrastChecker >> checkContrastBetween: color1 and: color2 [ 

	self firstColor: color1 .
	self secondColor: color2.
	^ self checkContrast 
]

{ #category : #'private-algorithm' }
ColorContrastChecker >> contrastRatioBetween: color1Luminance and: color2Luminance [
	
	"Algorithm taken from https://www.w3.org/TR/WCAG21/#contrast-minimum"
	
	^ color1Luminance > color2Luminance
		  ifTrue: [ color2Luminance + 0.05 / (color1Luminance + 0.05) ]
		  ifFalse: [ color1Luminance + 0.05 / (color2Luminance + 0.05) ]
]

{ #category : #accessing }
ColorContrastChecker >> firstColor [

	^ firstColor
]

{ #category : #accessing }
ColorContrastChecker >> firstColor: anObject [

	firstColor := anObject
]

{ #category : #initialization }
ColorContrastChecker >> initialize [ 

	super initialize .

]

{ #category : #printing }
ColorContrastChecker >> printOn: aStream [

	super printOn: aStream.
	aStream 
		nextPut: Character linefeed;
		nextPutAll: 'AA-level large text: '; 
		print: self aaLevelLargeText .
	aStream
		nextPut: Character linefeed;
		nextPutAll: 'AA-level small text: ';
		print: self aaLevelSmallText .
	aStream
		nextPut: Character linefeed;
		nextPutAll: 'AAA-level large text: ';
		print: self aaaLevelLargeText .
	aStream
		nextPut: Character linefeed;
		nextPutAll: 'AAA-level small text: ';
		print: self aaaLevelSmallText .
		
		
]

{ #category : #accessing }
ColorContrastChecker >> secondColor [

	^ secondColor
]

{ #category : #accessing }
ColorContrastChecker >> secondColor: anObject [

	secondColor := anObject
]

{ #category : #private }
ColorContrastChecker >> wcagMeasurement: aFloat [

	^ self checkContrast < aFloat
		  ifTrue: [ true ]
		  ifFalse: [ false ]
]
