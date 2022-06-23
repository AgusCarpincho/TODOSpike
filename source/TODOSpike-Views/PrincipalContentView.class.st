Class {
	#name : #PrincipalContentView,
	#superclass : #WAPainter,
	#instVars : [
		'openedToDosColumnView',
		'inProgressToDosColumnView',
		'finishedToDoListView',
		'repositorySystem',
		'principalContentContainerView'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'instance creation' }
PrincipalContentView class >> withRepositorySystem: aRepository [

	^ self new
		  initializeWithRepositorySystem: aRepository
]

{ #category : #configuring }
PrincipalContentView >> beIdentifiable [

	^ true
]

{ #category : #'initialization - private' }
PrincipalContentView >> initializeWithRepositorySystem: aRepositorySystem [

	repositorySystem := aRepositorySystem.
	openedToDosColumnView := ToDosColumnView
		                         withToDos: repositorySystem openedToDos
		                         named: 'Open'.
	inProgressToDosColumnView := ToDosColumnView
		                             withToDos:
		                             repositorySystem inProgressToDos
		                             named: 'In Progress'.
	finishedToDoListView := ToDosColumnView
		                        withToDos: repositorySystem finishedToDos
		                        named: 'Finished'.
		
	principalContentContainerView := ContainerWebView
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

{ #category : #rendering }
PrincipalContentView >> renderContentOn: aRenderer [

	aRenderer render: principalContentContainerView
]
