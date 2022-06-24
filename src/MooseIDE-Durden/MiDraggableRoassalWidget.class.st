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
MiDraggableRoassalWidget class >> defaultLayout [
	^ super defaultSpec
		add: #viewport;
		add: #refresh height: self toolbarHeight; 
		yourself
]

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
			self
				loadChart: aCanvas
				withElement: self element
				timeOut: 1 minutes.
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
MiDraggableRoassalWidget >> loadChart: aCanvas withElement: anElement timeOut: aTimeOut [

	| semaphore process error |

	semaphore := Semaphore new.
	process := [ 
	           [ self loadChart: aCanvas withElement: anElement ]
		           on: Error
		           do: [ :e | error := e ].
	           semaphore signal ] forkAt:
		           Processor userBackgroundPriority.
	process suspend.
	self wait: process over: semaphore for: aTimeOut.
	error ifNotNil: [ 
		self halt.
		error ]
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

{ #category : #initialization }
MiDraggableRoassalWidget >> wait: process over: semaphore for: aTimeOut [

	[ 
	process resume.
	semaphore
		wait: aTimeOut
		onCompletion: [ 
			process terminate.
			^ self ]
		onTimeout: [ process suspend ] ] doWhileTrue: [ 
		UIManager default confirm:
			'Graphic rendering timed out. Want to continue?' ].
	process terminate. 
	TimedOut new signal: 'Timed out'
]
