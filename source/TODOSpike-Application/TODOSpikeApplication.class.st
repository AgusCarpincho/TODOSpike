"
This is the TODOSpike-Application
"
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
	
	 ^ [ :canvas | canvas unorderedList
                   add: ComponentExample new ]
]

{ #category : #accessing }
TODOSpikeApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default
]
