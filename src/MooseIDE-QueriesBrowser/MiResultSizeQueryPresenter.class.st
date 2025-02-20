"
The query configuration presenter for `FQResultSizeQuery`
"
Class {
	#name : #MiResultSizeQueryPresenter,
	#superclass : #MiQueryConfiguratorPresenter,
	#instVars : [
		'subqueriesDropList',
		'comparatorDropList',
		'valueInputField'
	],
	#category : #'MooseIDE-QueriesBrowser-Configuration presenters'
}

{ #category : #accessing }
MiResultSizeQueryPresenter class >> dropListWidth [

	^ 57
]

{ #category : #actions }
MiResultSizeQueryPresenter >> computeQuery: anObject [

	subqueriesDropList items ifNotEmpty: [ 
		self query
			innerQuery: subqueriesDropList selectedItem query;
			comparator: comparatorDropList selectedItem;
			valueToCompare: valueInputField number;
			resetResult ]
]

{ #category : #initialization }
MiResultSizeQueryPresenter >> initializeComparatorsDropList [

	comparatorDropList := self newDropList.
	comparatorDropList
		items: FQNumericQuery comparators;
		display: [ :comparator | comparator asString ];
		whenSelectedItemChangedDo: [ :comparator | 
			self computeQueryAction: comparator ]
]

{ #category : #initialization }
MiResultSizeQueryPresenter >> initializePresenters [

	self initializeSubqueriesDropList.
	self initializeComparatorsDropList.
	self initializeValueInput.
	self initializeLayout
]

{ #category : #initialization }
MiResultSizeQueryPresenter >> initializeSubqueriesDropList [

	subqueriesDropList := self newDropList.
	subqueriesDropList
		items: owner allQueryPresentersExceptSelf;
		display: [ :each | each name ];
		whenSelectedItemChangedDo: [ :subQuery | 
			self computeQueryAction: subQuery ];
		help: 'The inner query can only be Scope or Navigation query'
]

{ #category : #initialization }
MiResultSizeQueryPresenter >> initializeValueInput [

	valueInputField := self newNumberInput.
	valueInputField
		placeholder: 'Value';
		whenNumberChangedDo: [ :newNumber | 
			self computeQueryAction: newNumber ]
]

{ #category : #layout }
MiResultSizeQueryPresenter >> newLayout [

	^ SpBoxLayout newLeftToRight
		  add: #subqueriesDropList width: self class dropListWidth;
		  add: #comparatorDropList width: 63;
		  add: #valueInputField width: 70;
		  yourself
]

{ #category : #'api - actions' }
MiResultSizeQueryPresenter >> queryPresentersListChanged [

	"Since the list of available queries of the MiQueryBuilder changed, we need to update the items on the drop list. We do not want to have deleted queries on the list or we want to add the new added query presenter."

	| newAvailableQueries previouslySelectedQuery |
	newAvailableQueries := owner allQueryPresentersExceptSelf.
	previouslySelectedQuery := subqueriesDropList selectedItem.
	(newAvailableQueries includes: previouslySelectedQuery)
		ifTrue: [ 
		subqueriesDropList updateItemsKeepingSelection: newAvailableQueries ]
		ifFalse: [ subqueriesDropList items: newAvailableQueries ]
]
