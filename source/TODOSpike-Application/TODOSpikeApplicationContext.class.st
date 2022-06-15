Class {
	#name : #TODOSpikeApplicationContext,
	#superclass : #Object,
	#instVars : [
		'currentWebView',
		'principalWebView'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #accessing }
TODOSpikeApplicationContext >> createPrincipalWebView [

	principalWebView := PrincipalWebView new
]

{ #category : #accessing }
TODOSpikeApplicationContext >> createRepositories [
	
	self shouldBeImplemented
]

{ #category : #accessing }
TODOSpikeApplicationContext >> currentWebView [

	^ currentWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> identifiedCurrentWebView [

	^ principalWebView identifiedCurrentWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> initialize [

	super initialize.
	self
		setCurrentWebViewTo: InstructionsWebView new;
		createRepositories ;createPrincipalWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> principalWebView [

	^ principalWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> setCurrentWebViewTo: aCurrentWebView [

	currentWebView := aCurrentWebView
]
