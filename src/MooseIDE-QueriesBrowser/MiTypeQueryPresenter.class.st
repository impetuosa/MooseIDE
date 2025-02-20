"
A query configuration presenter for the `FQTypeQuery` 

"
Class {
	#name : #MiTypeQueryPresenter,
	#superclass : #MiQueryConfiguratorPresenter,
	#instVars : [
		'typesButton',
		'typesList'
	],
	#category : #'MooseIDE-QueriesBrowser-Configuration presenters'
}

{ #category : #specs }
MiTypeQueryPresenter class >> title [
	^ 'Type Query'
]

{ #category : #actions }
MiTypeQueryPresenter >> computeQuery: aType [

	self updateQueryWithSelectedTypes: typesList selectedItems
]

{ #category : #initialization }
MiTypeQueryPresenter >> initializePresenters [

	self initializeTypesList.
	self initializeTypesButton.
	self initializeLayout
]

{ #category : #initialization }
MiTypeQueryPresenter >> initializeTypesButton [

	typesButton := self query availableTypes
		               ifEmpty: [ self noParameterMessage: 'type' ]
		               ifNotEmpty: [ 
			               self newButton
				               label: 'Select Types...';
				               action: [ 
					               self newPopover
						               relativeTo: typesButton;
						               bePositionRight;
						               presenter: typesList;
						               popup ];
				               yourself ]
]

{ #category : #initialization }
MiTypeQueryPresenter >> initializeTypesList [

	typesList := self newSelectableListForPopoverExtent: 120 @ 120.

	typesList
		display: [ :item | self labelFor: item ];
		items: self query availableTypes;
		selectItems: self query types;
		onActivation: [ :type | self computeQueryAction: type ];
		onDeactivation: [ :type | self computeQueryAction: type ]
]

{ #category : #'widgets configuration' }
MiTypeQueryPresenter >> labelFor: type [
	^ type mooseDescription name asEnglishPlural
]

{ #category : #layout }
MiTypeQueryPresenter >> newLayout [

	| padding |
	padding := 5.
	^ SpBoxLayout newLeftToRight
		  add: #typesButton
		  expand: false
		  fill: true
		  padding: padding;
		  yourself
]

{ #category : #initialization }
MiTypeQueryPresenter >> updateQueryWithSelectedTypes: selectedTypes [

	| nonSelectedTypes |
	nonSelectedTypes := self query types difference: selectedTypes.
	selectedTypes do: [ :type | self query addType: type ].
	nonSelectedTypes do: [ :type | self query removeType: type ]
]
