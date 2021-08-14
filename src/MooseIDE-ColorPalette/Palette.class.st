"
I am a color palette. I am represented by a dictionary of colors in which you can access colors.

To access the colors use #colorAt: by giving the key of the color. The Key may be an index or a name.

You can also replace a color by an other one by using #replaceColorAt:with:

See the comment of my subclasses to see the examples
"
Class {
	#name : #Palette,
	#superclass : #Object,
	#instVars : [
		'colorsDictionary'
	],
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #accessing }
Palette >> asCollection [

	^ colorsDictionary values
]

{ #category : #'color manipulation' }
Palette >> colorAt: key [

	"get a color specified by its key. I return the color corresponding of the specified key"

	^ colorsDictionary at: key
]

{ #category : #initialization }
Palette >> initialize [ 

	super initialize .
	colorsDictionary := OrderedDictionary new
]

{ #category : #'color manipulation' }
Palette >> replaceColorAt: key with: newColor [

	"Replace a color specified by its key with a new color newColor. Returns the newColor"
	
	| color |
	color := Color colorFrom: newColor .
	^ colorsDictionary associationAt: key ifPresent: [ colorsDictionary at: key put: color ]
	
	
	

]
