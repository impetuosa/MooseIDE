Class {
	#name : #MiModelNavigationBrowser,
	#superclass : #MiNavigationBrowser,
	#category : #'MooseIDE-NewTools-Inspector tabs'
}

{ #category : #initialization }
MiModelNavigationBrowser >> itemsFor: anEntity [

	^ anEntity navigationItemsFromPragmas
	  , anEntity navigationItemsFromAttributes
	  , anEntity customNavigationItems
]
