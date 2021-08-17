"
I am a RGB chooser, i am a subclass of SpRGBWidget and i override the #defaultSpec class method
"
Class {
	#name : #SpRGBSlider,
	#superclass : #SpRGBWidget,
	#instVars : [
		'rgbToString'
	],
	#category : #'MooseIDE-ColorPalette-SpColorChooser'
}

{ #category : #specs }
SpRGBSlider class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		add: #preview;
		add: #rgbToString height: 40;
		add: #sliders;
		yourself
]

{ #category : #initialization }
SpRGBSlider >> connectPresenters [ 

	super connectPresenters .
	sliders whenChangedDo: [ rgbToString text: '#', self color asHexString ].
]

{ #category : #initialization }
SpRGBSlider >> initializePresenters [ 

	super initializePresenters .
	rgbToString := self newText text: '#', self color asHexString 
]

{ #category : #api }
SpRGBSlider >> makeNewForm [ 

	^ (Form extent: 50 @ 50 depth: 32) fillColor: self color
]

{ #category : #accessing }
SpRGBSlider >> rgbToString [

	^ rgbToString
]
