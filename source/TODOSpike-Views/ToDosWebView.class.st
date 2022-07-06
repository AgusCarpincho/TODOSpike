Class {
	#name : #ToDosWebView,
	#superclass : #WAPainter,
	#instVars : [
		'openedToDosColumnView',
		'inProgressToDosColumnView',
		'finishedToDoListView',
		'toDosWebView'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'private - creating' }
ToDosWebView >> createColums [

	openedToDosColumnView := ToDosColumnView
		                         withToDos:
		                         self session applicationContext
			                         repositorySystem openedToDos
		                         named: 'Open'.
	inProgressToDosColumnView := ToDosColumnView
		                         withToDos:
		                         self session applicationContext
			                         repositorySystem inProgressToDos
		                         named: 'In Progress'.
	finishedToDoListView := ToDosColumnView
		                         withToDos:
		                         self session applicationContext
			                         repositorySystem finishedToDos
		                         named: 'Finished'.
]

{ #category : #'private - creating' }
ToDosWebView >> createContainerForColumns [

	^ ContainerWebView
		  wrapping: [ :canvas | 
			  canvas render: openedToDosColumnView.
			  canvas render: inProgressToDosColumnView.
			  canvas render: finishedToDoListView ]
		  intoElementBuiltUsing: [ :theContainer | theContainer div ]
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
					  display: 'inline-flex';
					  height: 'max-content';
					  fontSize: 20 px;
					  width: 'max-content';
					  margin: 20 px ] ]
]

{ #category : #initialization }
ToDosWebView >> initialize [

	self createColums.

	toDosWebView := self createContainerForColumns.

	toDosWebView beIdentifiable
]

{ #category : #rendering }
ToDosWebView >> renderContentOn: aRenderer [

	aRenderer render: toDosWebView
]
