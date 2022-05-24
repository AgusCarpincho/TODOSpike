Class {
	#name : #TODOSpikeApplication,
	#superclass : #WillowApplication,
	#category : #'TODOSpike-Application'
}

{ #category : #accessing }
TODOSpikeApplication class >> applicationTitle [

	^ 'TODOSpike'
]

{ #category : #accessing }
TODOSpikeApplication class >> handlerName [

	^ 'todo'
]

{ #category : #accessing }
TODOSpikeApplication >> componentSupplierForApplication [

	^ Bootstrap3ComponentSupplier online
]

{ #category : #accessing }
TODOSpikeApplication >> contentView [

	"^ self subclassResponsibility"
]

{ #category : #accessing }
TODOSpikeApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default
]
