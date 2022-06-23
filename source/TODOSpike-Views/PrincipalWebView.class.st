Class {
	#name : #PrincipalWebView,
	#superclass : #WAPainter,
	#instVars : [
		'identifiedCurrentWebView',
		'navBar'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #accessing }
PrincipalWebView >> identifiedCurrentWebView [

	^ identifiedCurrentWebView
]

{ #category : #accessing }
PrincipalWebView >> initialize [

	super initialize.
	self
		initializeNavBarWebView;
		initializeIdentifiedCurrentWebView
]

{ #category : #accessing }
PrincipalWebView >> initializeIdentifiedCurrentWebView [

	identifiedCurrentWebView := self componentSupplier
		                            divisionContainerWrapping: [ :aCanvas | 
			                            aCanvas render:
				                            self session applicationContext
					                            currentWebView ]
		                            applying: [  ].

	identifiedCurrentWebView beIdentifiable
]

{ #category : #initialization }
PrincipalWebView >> initializeNavBarWebView [

	navBar := NavBarView new
]

{ #category : #rendering }
PrincipalWebView >> renderContentOn: aCanvas [
	aCanvas
		render: navBar;
		render: identifiedCurrentWebView
]
