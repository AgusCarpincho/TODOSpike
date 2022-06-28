Class {
	#name : #ToDosColumnView,
	#superclass : #WAPainter,
	#instVars : [
		'toDosColumnView'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #configuring }
ToDosColumnView class >> withToDos: aToDos named: aName [

	^ self new initializeWithToDos: aToDos named: aName
]

{ #category : #'private - creating' }
ToDosColumnView >> createAToDoViewWith: aToDo [

	^ ToDoView
		  with: aToDo
]

{ #category : #'private - creating' }
ToDosColumnView >> createHeadingWebViewLabeled: aTitle [

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
ToDosColumnView >> initializeWithToDos: aToDos named: aName [

	toDosColumnView := ContainerWebView
		                   wrapping: [ :canvas | 
			                   canvas render:
				                   (self createHeadingWebViewLabeled: aName).
			                   aToDos do: [ :toDo | 
				                   canvas render: (self createAToDoViewWith: toDo) ] ]
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
					                   display: 'table';
					                   fontSize: 20 px;
					                   width: 500 px;
					                   margin: 20 px ] ]
]

{ #category : #rendering }
ToDosColumnView >> renderContentOn: aRenderer [

	aRenderer render: toDosColumnView.
]
