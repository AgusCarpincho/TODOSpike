Class {
	#name : #TODOSpikeApplicationContext,
	#superclass : #Object,
	#instVars : [
		'currentWebView',
		'repositorySystem',
		'principalWebView'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #accessing }
TODOSpikeApplicationContext >> currentWebView [

	^ currentWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> identifiedCurrentWebView [

	^ principalWebView identifiedCurrentWebView
]

{ #category : #initialization }
TODOSpikeApplicationContext >> initialize [

	super initialize.
	self
		settingNewRepositorySystem;
		settingCurrentWebViewTo: ContentInformationWebView new;
		settingNavBarWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> principalWebView [

	^ principalWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> repositorySystem [

	^ repositorySystem
]

{ #category : #setting }
TODOSpikeApplicationContext >> settingCurrentWebViewTo: aCurrentWebView [

	currentWebView := aCurrentWebView
]

{ #category : #setting }
TODOSpikeApplicationContext >> settingNavBarWebView [

	"principalWebView := PrincipalContentView withRepositorySystem:
		                    repositorySystem"

	principalWebView := PrincipalWebView new
]

{ #category : #setting }
TODOSpikeApplicationContext >> settingNewRepositorySystem [

	repositorySystem := RepositorySystem new
]
