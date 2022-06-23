Class {
	#name : #ToDoView,
	#superclass : #WAPainter,
	#instVars : [
		'lookDescriptionButton',
		'modifyListSelection',
		'toDoView',
		'deleteToDoButton'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #initialization }
ToDoView class >> with: aToDoNote [

	^ self new initializeWith: aToDoNote
]

{ #category : #'private - creating' }
ToDoView >> createDeleteToDoButton [

	^ AsynchronicButtonWebView labeled: 'X' applying: [ :canvas | 
		  canvas setStyleTo: [ :style | 
			  style
				  color: #white;
				  backgroundColor: '#C41010';
				  height: 50 px;
				  width: 50 px;
				margin: 5 px;
				  fontFamily: 'Roboto';
				  fontWeight: #bold;
				  fontSize: 30 px;
				  borderRadius: 10 px ] ]
]

{ #category : #'private - creating' }
ToDoView >> createLookDescriptionButton [

	^ AsynchronicButtonWebView labeled: 'i' applying: [ :canvas | 
		  canvas setStyleTo: [ :style | 
			  style
				  color: #white;
				  backgroundColor: '#14BAD8';
				  height: 50 px;
				  width: 50 px;margin: 5 px;
				  fontFamily: 'Roboto';
				  fontWeight: #bold;
				  fontSize: 30 px;
				  borderRadius: 10 px ] ]
]

{ #category : #'private - creating' }
ToDoView >> createModifyListSelection [

	^ AsynchronicButtonWebView labeled: 'Edit' applying: [ :canvas | 
		  canvas setStyleTo: [ :style | 
			  style
				  color: #white;
				  backgroundColor: '#EE8625';
				  height: 50 px;
				  width: 80 px;margin: 5 px;
				  fontFamily: 'Roboto';
				  fontWeight: #bold;
				  fontSize: 30 px;
				  borderRadius: 10 px ] ]
]

{ #category : #'initialization - private' }
ToDoView >> initializeWith: aToDo [

	lookDescriptionButton := self createLookDescriptionButton.
	modifyListSelection := self createModifyListSelection.
	deleteToDoButton := self createDeleteToDoButton.

	toDoView := ContainerWebView
		            wrapping: [ :canvas | 
			            canvas render:
				            '#' , aToDo identifier greaseString , ' '.
			            canvas render: aToDo category greaseString , ' '.
			            canvas render: lookDescriptionButton.
			            canvas render: modifyListSelection.
			            canvas render: deleteToDoButton ]
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
					            display: 'inline-block';
					            height: 80 px;
					            fontSize: 30 px;
					            width: 370 px;
					            margin: 10 px ] ]
]

{ #category : #rendering }
ToDoView >> renderContentOn: aRenderer [

	aRenderer render: toDoView
]
