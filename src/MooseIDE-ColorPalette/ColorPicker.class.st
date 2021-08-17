"
I am a color chooser, I'm the color palette user interface for visualizations.

Run with:
```Smalltalk
ColorPicker new openWithSpec
```

<TODO>
"
Class {
	#name : #ColorPicker,
	#superclass : #SpPresenter,
	#instVars : [
		'numberOfColors',
		'minorColor',
		'majorColor',
		'contrastedColor',
		'nextColor',
		'previousColor',
		'rgbSlider',
		'accept',
		'paletteSample'
	],
	#category : #'MooseIDE-ColorPalette-SpColorChooser'
}

{ #category : #specs }
ColorPicker class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newTopToBottom
				   add: 'Minor color' height: 30;
				   add: #minorColor height: 40;
				   yourself)
		  height: 70;
		  add: (SpBoxLayout newTopToBottom
				   add: 'Major color' height: 30;
				   add: #majorColor height: 40;
				   yourself)
		  height: 70;
		  add: (SpBoxLayout newTopToBottom
				   add: 'Contrasted color' height: 30;
				   add: #contrastedColor height: 40;
				   yourself)
		  height: 70;
		  add: (SpBoxLayout newTopToBottom
				   add: 'Number of colors' height: 30;
				   add: #numberOfColors height: 40;
				   yourself)
		  height: 70;
		  add: (SpBoxLayout newTopToBottom
				   add: #rgbSlider ;
				   yourself);
			add: #paletteSample;
		  add: #accept height: 50;
		  yourself
]

{ #category : #examples }
ColorPicker class >> open [

	<script>
	self new openWithSpec
]

{ #category : #accessing }
ColorPicker class >> title [ 
	
	^ 'Color picker'
]

{ #category : #specs }
ColorPicker class >> windowSize [

	^ 700 @ 700
]

{ #category : #accessing }
ColorPicker >> accept [

	^ accept
]

{ #category : #helper }
ColorPicker >> choosedColor [

	^ rgbSlider color
]

{ #category : #accessing }
ColorPicker >> contrastedColor [

	^ contrastedColor 
]

{ #category : #initialization }
ColorPicker >> initializePresenters [

	rgbSlider := self instantiate: SpRGBSlider.
	minorColor := self newText.
	majorColor := self newText.
	contrastedColor := self newText.
	numberOfColors := self newText.
	accept := self newButtonBar
		          placeAtEnd;
		          add: (self newButton label: 'accept');
		          yourself.
	paletteSample := self newToolbar .
	self palette do: [ :color | paletteSample addItem: (self makeColorSample: color) ]
]

{ #category : #initialization }
ColorPicker >> initializeWindow: aWindowPresenter [
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter initialExtent: self class windowSize
]

{ #category : #accessing }
ColorPicker >> majorColor [

	^ majorColor
]

{ #category : #initialization }
ColorPicker >> makeColorSample: aColor [

	^ SpToolbarButtonPresenter new
		  icon:
			  ((Form extent:  self sampleSize @ self sampleSize depth: 32) 
				   fillColor: aColor);
		  color: aColor;
		  action: [ self rgbSlider sliders redSlider value: ((aColor red * 255) round: 1).
							self rgbSlider sliders greenSlider value: ((aColor green * 255) round: 1).
							self rgbSlider sliders	 blueSlider value: ((aColor blue * 255) round: 1) ];
		  yourself
]

{ #category : #accessing }
ColorPicker >> minorColor [

	^ minorColor
]

{ #category : #accessing }
ColorPicker >> nextColor [

	^ nextColor
]

{ #category : #accessing }
ColorPicker >> numberOfColors [

	^ numberOfColors
]

{ #category : #accessing }
ColorPicker >> palette [ 

	^ (ClPPaletteGenerator fixedQualitative generate: 15) asCollection
]

{ #category : #accessing }
ColorPicker >> paletteSample [

	^ paletteSample
]

{ #category : #accessing }
ColorPicker >> previousColor [

	^ previousColor
]

{ #category : #helper }
ColorPicker >> rgbColorChooser [

	^ (Form extent: 100 @ 100 depth: 32) fillColor: self choosedColor
]

{ #category : #accessing }
ColorPicker >> rgbSlider [

	^ rgbSlider
]

{ #category : #initialization }
ColorPicker >> sampleSize [

	^ (self class buttonWidth / 3) asInteger
]
