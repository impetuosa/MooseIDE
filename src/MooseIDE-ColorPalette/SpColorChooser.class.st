"
I am a color chooser, I'm the color palette user interface for visualizations.

Run with:
```Smalltalk
SpColorChooser new openWithSpec
```

<TODO>
"
Class {
	#name : #SpColorChooser,
	#superclass : #SpPresenter,
	#instVars : [
		'numberOfColors',
		'minorColor',
		'majorColor',
		'contrastingColor',
		'nextColor',
		'previousColor',
		'rgbSlider'
	],
	#category : #'MooseIDE-ColorPalette-SpColorChooser'
}

{ #category : #specs }
SpColorChooser class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		add: #rgbSlider;
		yourself
]

{ #category : #examples }
SpColorChooser class >> example [

	<sampleInstance>
	| example |
	example := self new
		extent: 300 @ 250;
		openWithSpec;
		yourself.	
	^ example
]

{ #category : #accessing }
SpColorChooser class >> title [ 
	
	^ 'Color picker'
]

{ #category : #'as yet unclassified' }
SpColorChooser >> choosedColor [

	^ rgbSlider color
]

{ #category : #accessing }
SpColorChooser >> contrastingColor [

	^ contrastingColor
]

{ #category : #initialization }
SpColorChooser >> initializePresenters [
	
	rgbSlider := self instantiate: SpRGBWidget 
]

{ #category : #accessing }
SpColorChooser >> majorColor [

	^ majorColor
]

{ #category : #accessing }
SpColorChooser >> minorColor [

	^ minorColor
]

{ #category : #accessing }
SpColorChooser >> nextColor [

	^ nextColor
]

{ #category : #accessing }
SpColorChooser >> numberOfColors [

	^ numberOfColors
]

{ #category : #accessing }
SpColorChooser >> previousColor [

	^ previousColor
]

{ #category : #'as yet unclassified' }
SpColorChooser >> rgbColorChooser [

	^ (Form extent: 80 @ 80 depth: 32) fillColor: self choosedColor
]

{ #category : #accessing }
SpColorChooser >> rgbSlider [

	^ rgbSlider
]
