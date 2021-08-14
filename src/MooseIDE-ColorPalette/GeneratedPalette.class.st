"
I am the generated palette  

When you want to add a color in the dictionary use **#add: aColor**, which adds a color whose key is an index (by default) generated automatically in the dictionary.

**Add as many colors as you want:**
```Smalltalk
p := GeneratedPalette new .
p add: Color red;
  add: Color lightBlue
```

Use **#addName:forColor:** to name a color and add it to the color dictionary.

**Select a color:**
```Smalltalk
p := GeneratedPalette sample24Colors.
p colorAt: 1
```

**To move between colors:**
```Smalltalk
p := GeneratedPalette sample24Colors.
p currentColor ""by default returns the first color in the list of colors in the palette"" 
```
**You can get the next color:**
```Smalltalk
p := GeneratedPalette sample24Colors.
p nextColor ""return the next color of the current color""
```

**You can also get the previous color:**
```Smalltalk
p := GeneratedPalette sample24Colors.
p previousColor ""return the previous color of the current color""
```
If you have chosen a color, so the current color is the selected color
```Smalltalk
p := GeneratedPalette sample24Colors.
p colorAt: 3. ""the 3rd color is chosen""
p currentColor. ""return the 3rd color""
p nextColor. ""return the 4th color"" 
p currentColor ""return the 4th color""
```

**Use #withAll: to add a collection of colors, so that the keys are the indexes of each color according to their order in the collection.**
```Smalltalk
p := GeneratedPalette withAll: { Color red. Color blue. Color green }
```
**Get the collection of colors of the palette**
```Smalltalk
p := GeneratedPalette sample24Colors.
p asCollection
```
"
Class {
	#name : #GeneratedPalette,
	#superclass : #Palette,
	#instVars : [
		'currentShift',
		'index'
	],
	#category : #'MooseIDE-ColorPalette-Palette'
}

{ #category : #private }
GeneratedPalette class >> checkAllElementsAreColors: aCollectionOfColors [

	"private. check if all the elements of the collection are an instance of Color"

	^ aCollectionOfColors allSatisfy: [ :each | each isColor ]
]

{ #category : #colors }
GeneratedPalette class >> example24Colors [
	
	self sample24Colors asCollection inspect
	
]

{ #category : #colors }
GeneratedPalette class >> sample24Colors [
	
	| palette |
	palette := self new.
	palette 
		add: (Color fromString: '#4572a7');
		add: (Color fromString: '#c0504d');
		add: (Color fromString: '#9bbb28'); 
		add: (Color fromString: '#8064a2'); 
		add: (Color fromString: '#4bacc6');  
		add: (Color fromString: '#f79646');
		add: (Color fromString: '#fdd600');
		add: (Color fromString: '#2185ff');
		add: (Color fromString: '#ce3b37');
		add: (Color fromString: '#6bbd46');
		add: (Color fromString: '#834ec5');
		add: (Color fromString: '#21c1ed');
		add: (Color fromString: '#fa6d10');
		add: (Color fromString: '#fff114');
		add: (Color fromString: '#9db3d9');
		add: (Color fromString: '#db9d9d');
		add: (Color fromString: '#c2d7a1');
		add: (Color fromString: '#b4a7c8');
		add: (Color fromString: '#9dd9d4');
		add: (Color fromString: '#d9b99d');
		add: (Color fromString: '#d9d19d');
		add: (Color fromString: '#ffffff');
		add: (Color fromString: '#000000');
		add: (Color fromString: '#9c9c9c').
	^ palette
	
]

{ #category : #'instance creation' }
GeneratedPalette class >> withAll: collectionOfColors [
	
	"I add all the colors contained in the collectionnOfColors to the dictionary. I take a collection of colors as values, so the keys will be their indexes according to their orders in the collection"
	
	| newInstance |
	newInstance := self new.
	(self checkAllElementsAreColors: collectionOfColors)
		ifTrue: [ collectionOfColors do: [ :color | newInstance add: color ] ]
		ifFalse: [ Error signal: 'Not all elements are instance of Color' ].
	^ newInstance 
]

{ #category : #adding }
GeneratedPalette >> add: aColor [

	"I add a color whose key is an index to the dictionary of colors. Only an instance of Color is allowed. The added color is returned"
	
	| color |
	color := Color colorFrom: aColor.
	colorsDictionary add: (index+1) -> color.
	self updateIndexColor: index + 1 .
	^ color
]

{ #category : #private }
GeneratedPalette >> addName: aName forColor: aColor [
	
	"Associate a name 'aName' with a color 'color', and add the association (aName -> aColor) to the colors dictionary"
	
	| color |
	color := Color colorFrom: aColor.
	colorsDictionary add: aName -> color.
	self updateIndexColor: (colorsDictionary indexOfKey: aName)
	
]

{ #category : #accessing }
GeneratedPalette >> colorAt: anIndex [
	
	"I return the color at the index anIndex from the colorsDictionary. When using this method, the #currentColor is updated to the returned value"
	
	self updateCurrentColor: anIndex.
	^ super colorAt: anIndex 	
]

{ #category : #accessing }
GeneratedPalette >> currentColor [
	
	"get the current color in the list of the colors"
	
	^ self colorAt: currentShift . 
	
]

{ #category : #'palette-variant' }
GeneratedPalette >> darkerPalette [

	"Answer a new GeneratedPalette with darker colors"

	| darkerColors |
	darkerColors := colorsDictionary collect: [ :each | each value adjustBrightness: -0.3 ].
	colorsDictionary removeAll.
	self updateIndexColor: 1.
	^ self class withAll: darkerColors
]

{ #category : #'palette-variant' }
GeneratedPalette >> darkerPalette: aFloat [

	"Answer a new GeneratedPalette with darker colors. 
	 The level of darkness is defined by the argument aFloat which must be between [0, 1]"

	| darkerColors |
	darkerColors := colorsDictionary collect: [ :each | each value adjustBrightness: aFloat negated ].
	colorsDictionary removeAll.
	self updateIndexColor: 1.
	^ self class withAll: darkerColors
]

{ #category : #accessing }
GeneratedPalette >> first [ 
	
	^ self colorAt: 1
]

{ #category : #initialization }
GeneratedPalette >> initialize [ 

	super initialize .
	currentShift := 1.
	index := 0
]

{ #category : #accessing }
GeneratedPalette >> last [
	
	^ self colorAt: self asCollection size
]

{ #category : #'palette-variant' }
GeneratedPalette >> lighterPalette [
	
	"Answer a new GeneratedPalette with lighter colors"
	
	| lighterColors |
	lighterColors := colorsDictionary collect: [ :each | 
		                 each value saturation >= 0.4
			                 ifTrue: [ each value adjustSaturation: -0.4 brightness: 0.08 ]
			                 ifFalse: [ each value adjustSaturation: -0.08 brightness: 0.08 ] ].
	colorsDictionary removeAll .
	self updateIndexColor: 1.
	^ self class withAll: lighterColors
]

{ #category : #accessing }
GeneratedPalette >> nextColor [
	
	"get the next color of the current color(use #currentColor) in the list of colors. If the current color is the last color, then the next color is the first color in the color list."
	
	| color nextShift |
	nextShift := currentShift + 1.
	nextShift > (colorsDictionary size) ifTrue: [ nextShift := 1 ].
	color := self asCollection at: nextShift.
	self updateCurrentColor: nextShift . 
	^ color
]

{ #category : #accessing }
GeneratedPalette >> previousColor [
	
	"get the previous color of the current color(use #currentColor) in the list of colors"
	
	| color previousShift |
	previousShift := currentShift - 1.
	previousShift < 1 ifTrue: [ previousShift := colorsDictionary size ].
	color := self asCollection at: previousShift. 
	self updateCurrentColor: previousShift .
	^ color
]

{ #category : #accessing }
GeneratedPalette >> second [ 
	
	^ self colorAt: 2
]

{ #category : #accessing }
GeneratedPalette >> third [
	
	^ self colorAt: 3
]

{ #category : #private }
GeneratedPalette >> updateCurrentColor: anIndex [

	currentShift := anIndex
]

{ #category : #private }
GeneratedPalette >> updateIndexColor: anIndex [

	index := anIndex
]
