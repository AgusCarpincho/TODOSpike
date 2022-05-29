Class {
	#name : #ToDoListColumnView,
	#superclass : #WAPainter,
	#instVars : [
		'title'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #configuring }
ToDoListColumnView class >> title: aTitle [

	^ self new initializeWith: aTitle
]

{ #category : #initialization }
ToDoListColumnView >> initializeWith: aTitle [

	title := HeadingWebView
		         displaying: aTitle
		         withLevel: 2
		         applying: [ :canvas | 
			         canvas setStyleTo: [ :style | 
				         style
					         color: #black;
					         fontFamily: #Roboto;
					         margin: 20 px;
					         marginTop: 30 px ] ]
]

{ #category : #rendering }
ToDoListColumnView >> renderContentOn: aRenderer [

	aRenderer render: title
]
