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

	^ 'home'
]

{ #category : #accessing }
TODOSpikeApplication >> componentSupplierForApplication [

	^ Bootstrap3ComponentSupplier online
]

{ #category : #accessing }
TODOSpikeApplication >> contentView [

	^ 'Hello world'
	
]

{ #category : #accessing }
TODOSpikeApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default
]
