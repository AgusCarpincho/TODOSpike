Class {
	#name : #TODOSpikeApplicationContext,
	#superclass : #Object,
	#instVars : [
		'currentWebView',
		'repositorySystem',
		'mainWebView'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #configuring }
TODOSpikeApplicationContext >> configuringCurrentWebViewTo: aCurrentWebView [

	currentWebView := aCurrentWebView
]

{ #category : #configuring }
TODOSpikeApplicationContext >> configuringMainWebView [

	mainWebView := MainWebView new
]

{ #category : #configuring }
TODOSpikeApplicationContext >> configuringNewRepositorySystem [

	repositorySystem := RepositorySystem new
]

{ #category : #accessing }
TODOSpikeApplicationContext >> currentWebView [

	^ currentWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> identifiedCurrentWebView [

	^ mainWebView identifiedCurrentWebView
]

{ #category : #initialization }
TODOSpikeApplicationContext >> initialize [

	super initialize.
	self
		configuringNewRepositorySystem;
		configuringCurrentWebViewTo: WelcomeWebView new;
		configuringMainWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> mainWebView [

	^ mainWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> repositorySystem [

	^ repositorySystem
]
