Class {
	#name : #MiCoyaModelsBrowser,
	#superclass : #CoyaSpecWidget,
	#instVars : [
		'#models',
		'#mooseModel => CoyaPublishSlot topic: #ui/selection/runningMooseModel'
	],
	#category : #'MooseIDE-Coya-Browser'
}

{ #category : #'instance creation' }
MiCoyaModelsBrowser class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: #models;
		  yourself
]

{ #category : #'instance creation' }
MiCoyaModelsBrowser class >> new [ 
	^ self newApplication: MiCoyaApplication instance. 
]

{ #category : #'instance creation' }
MiCoyaModelsBrowser class >> open [

	<example>
	self new openWithSpec
]

{ #category : #initialization }
MiCoyaModelsBrowser >> initializePresenters [

	super initializePresenters.
	models := self newList.
	models items: (self request: #listModels).
	
	models whenSelectionChangedDo: [ :s | mooseModel := s selectedItem ]
]

{ #category : #initialization }
MiCoyaModelsBrowser >> initializeTopicsAndServices [

	super initializeTopicsAndServices.
	self
		subscribe: #allMooseModels
		activating: #updateListModels:
		filter: (CoyaFilter shouldBeKindOf: MooseModel)
]

{ #category : #initialization }
MiCoyaModelsBrowser >> updateListModels: aList [
	models items: aList.
]
