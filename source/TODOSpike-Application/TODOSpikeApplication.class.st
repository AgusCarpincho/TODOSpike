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
TODOSpikeApplication class >> sessionClass [

	^ TODOSpikeSession
]

{ #category : #'server operations' }
TODOSpikeApplication class >> startAsDevelopment [

	(ZnZincServerAdaptor port: 8080) start.
	self registerAsDevelopmentApplication
]

{ #category : #'server operations' }
TODOSpikeApplication class >> stop [

	self unregisterFromApplications.
	(ZnZincServerAdaptor port: 8080) stop.
]

{ #category : #accessing }
TODOSpikeApplication >> componentSupplierForApplication [

	 ^ Bootstrap3ComponentSupplier online
]

{ #category : #accessing }
TODOSpikeApplication >> contentView [

	^ self session applicationContext principalWebView
]

{ #category : #hooks }
TODOSpikeApplication >> initialRequest: request [

	super initialRequest: request
]

{ #category : #accessing }
TODOSpikeApplication >> jQueryLibrary [
  ^ JQuery3OnlineLibrary default
]
