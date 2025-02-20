Class {
	#name : #MiScopeQueriesPresenterTest,
	#superclass : #MiQueryConfiguratorPresenterTest,
	#category : #'MooseIDE-QueriesBrowser-Tests-Queries Configuration'
}

{ #category : #running }
MiScopeQueriesPresenterTest >> classToTest [
	^ MiScopeQueryPresenter
]

{ #category : #running }
MiScopeQueriesPresenterTest >> queryClass [
	^ FQScopeQuery
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> selectNonSelectedDirection [

	presenter directionsDropList selectItem:
		presenter directionsDropList items last
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testChangingDirectionChangesAvailableScopes [

	| initialScopes |
	initialScopes := presenter query availableScopes copy.

	self selectNonSelectedDirection.

	self
		denyCollection: initialScopes
		hasSameElements: presenter query availableScopes
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testDropListMatchesAvailableScopes [

	| scopes |
	scopes := presenter query availableScopes.

	self
		assert: presenter scopesDropList listItems size
		equals: scopes size.

	self
		assertCollection: scopes
		hasSameElements: presenter scopesDropList listItems
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testDropListMatchesForOtherDirection [

	self selectNonSelectedDirection.

	self testDropListMatchesAvailableScopes.
	self testDropListMatchesQuery
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testDropListMatchesQuery [

	self
		assert: presenter scopesDropList selectedItem
		equals: presenter query scope.

	presenter scopesDropList selectItem:
		(presenter query availableScopes detect: [ :scope | 
			 presenter query scope ~~ scope ]).

	self
		assert: presenter scopesDropList selectedItem
		equals: presenter query scope
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testNoScopesForADirection [

	self resetPresenterWithEntities: helper entitiesWithNoDownScope.

	presenter directionsDropList selectItem: FQScopeDown.

	self
		assert: presenter scopesDropList class
		identicalTo: MiNoPossibleQueryPresenter
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testPresenters [

	self
		assert: presenter directionsDropList class
		identicalTo: SpDropListPresenter.
	self
		assert: presenter scopesDropList class
		identicalTo: SpDropListPresenter
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testPresentersOnImpossibleQuery [

	self resetPresenterWithEntities: helper noEntities.

	self
		assert: presenter directionsDropList class
		identicalTo: SpDropListPresenter.

	self
		assert: presenter scopesDropList class
		identicalTo: MiNoPossibleQueryPresenter
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testQueryValidity [

	self assert: presenter query isValid.

	self selectNonSelectedDirection.
	self assert: presenter query isValid.

	presenter scopesDropList selectItem:
		(presenter scopesDropList listItems copyWithout:
			 presenter scopesDropList selectedItem) anyOne.
	self assert: presenter query isValid.

	self resetPresenterWithEntities: helper entitiesWithNoDownScope.
	presenter directionsDropList selectItem: FQScopeDown.
	self deny: presenter query isValid.

	self resetPresenterWithEntities: helper noEntities.
	self deny: presenter query isValid
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testRadioButtonsMatchAvailableDirections [

	| directions |
	directions := presenter query directionStrategies.
	self
		assert: presenter directionsDropList items size
		equals: directions size.

	self
		assertCollection: (directions collect: #label)
		hasSameElements:
		(presenter directionsDropList items collect: #label)
]

{ #category : #tests }
MiScopeQueriesPresenterTest >> testRadioButtonsMatchQuery [

	self
		assert: presenter directionsDropList selectedItem label
		equals: presenter query directionStrategy label.

	self selectNonSelectedDirection.
	self
		assert: presenter directionsDropList selectedItem label
		equals: presenter query directionStrategy label
]
