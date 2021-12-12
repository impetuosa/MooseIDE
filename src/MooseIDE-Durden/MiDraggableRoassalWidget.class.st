"
I allow to drag my roassal content into a MiDropIntoBrowser
"
Class {
	#name : #MiDraggableRoassalWidget,
	#superclass : #MiDraggableAbstractWidget,
	#instVars : [
		'viewport',
		'refresh',
		'mustRefresh'
	],
	#category : #'MooseIDE-Durden'
}

{ #category : #specs }
MiDraggableRoassalWidget class >> defaultSpec [
	^ super defaultSpec
		add: #viewport;
		add: #refresh height: self toolbarHeight; 
		yourself
]

{ #category : #specs }
MiDraggableRoassalWidget class >> isAbstract [

	^ self = MiDraggableRoassalWidget
]

{ #category : #initialization }
MiDraggableRoassalWidget >> element [

	^ toSelect
]

{ #category : #initialization }
MiDraggableRoassalWidget >> followAction [

	self viewport script: [ :aCanvas | 
		self mustRefresh ifTrue: [ 
			self loadChart: aCanvas withElement: self element.
			mustRefresh := false ] ]
]

{ #category : #initialization }
MiDraggableRoassalWidget >> hasBeenReinstalled [
	super hasBeenReinstalled.
	mustRefresh := true.
]

{ #category : #initialization }
MiDraggableRoassalWidget >> initializePresenters [

	super initializePresenters.
	viewport := self instantiate:
		            (self class environment classNamed: #SpRoassalPresenter).
	refresh := self newButton.
	refresh label: 'Refresh'.
	refresh action: [ self refresh ].
	mustRefresh := true. 
]

{ #category : #initialization }
MiDraggableRoassalWidget >> loadChart: aCanvas withElement: anElement [ 

	self subclassResponsibility

]

{ #category : #initialization }
MiDraggableRoassalWidget >> mustRefresh [

	^ mustRefresh ifNil: [ false ]
]

{ #category : #initialization }
MiDraggableRoassalWidget >> refresh [
	mustRefresh := true. 
	self followAction
]

{ #category : #initialization }
MiDraggableRoassalWidget >> selectEntity: anEntity [

	"accessing"

	anEntity ifNil: [ ^ self ].
	freezeButton ifNotNil: [ :f | f state ifTrue: [ ^ self ] ].
	(self accept: anEntity) ifFalse: [ ^ self ].
	mustRefresh := true.
	super selectEntity: anEntity
]

{ #category : #initialization }
MiDraggableRoassalWidget >> viewport [

	^ (viewport isKindOf: SpLabelPresenter)
		  ifTrue: [ viewport := self instantiate: SpRoassalPresenter ]
		  ifFalse: [ viewport ]
]
