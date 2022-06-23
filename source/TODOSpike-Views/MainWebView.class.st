Class {
	#name : #MainWebView,
	#superclass : #WAPainter,
	#instVars : [
		'lookDescriptionButton',
		'modifyListSelection',
		'toDoView',
		'deleteToDoButton',
		'navBar',
		'identifiedCurrentWebView'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #accessing }
MainWebView >> identifiedCurrentWebView [

	^ identifiedCurrentWebView
]

{ #category : #initialization }
MainWebView >> initialize [

	"super initialize."
	navBar := NavegationBarView new.
	self initializeIdentifiedCurrentWebView
]

{ #category : #accessing }
MainWebView >> initializeIdentifiedCurrentWebView [

	identifiedCurrentWebView := self componentSupplier
		                            divisionContainerWrapping: [ :aCanvas | 
			                            aCanvas render:
				                            self session applicationContext
					                            currentWebView ]
		                            applying: [  ].

	identifiedCurrentWebView beIdentifiable
]

{ #category : #rendering }
MainWebView >> renderContentOn: aRenderer [

	aRenderer render: navBar; render: identifiedCurrentWebView .
]

{ #category : #initialization }
MainWebView >> updateNavBar [
	"super initialize."

	navBar := NavegationBarView new
]
