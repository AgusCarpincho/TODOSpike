Class {
	#name : #ToDoListColumnView,
	#superclass : #WAPainter,
	#instVars : [
		'title',
		'toDoListColumnView'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #configuring }
ToDoListColumnView class >> title: aTitle [

	^ self new initializeWith: aTitle
]

{ #category : #'initialization - private' }
ToDoListColumnView >> createHeadingWebViewWith: aTitle [

	^ HeadingWebView
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

{ #category : #'initialization - private' }
ToDoListColumnView >> initializeWith: aTitle [

	title := self createHeadingWebViewWith: aTitle.

	toDoListColumnView := ContainerWebView
		                      wrapping: title
		                      intoElementBuiltUsing: [ :canvas | canvas div ]
		                      applying: [ :theContainer | 
			                      theContainer addClass willow.
			                      theContainer setStyleTo: [ :style | 
				                      style
					                      backgroundColor: '#	F3F3F3';
					                      boxShadow:
						                      '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
					                      color: '#EE8625';
					                      borderRadius: 10 px;
					                      padding: 20 px;
					                      height: 500 px;
					                      fontSize: 20 px;
					                      width: 400 px;
					                      margin: 20 px ] ]
]

{ #category : #rendering }
ToDoListColumnView >> renderContentOn: aRenderer [

	aRenderer render: toDoListColumnView
]
