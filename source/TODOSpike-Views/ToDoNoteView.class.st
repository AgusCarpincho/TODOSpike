Class {
	#name : #ToDoNoteView,
	#superclass : #WAPainter,
	#instVars : [
		'modelToRepresent',
		'toDoNoteView',
		'lookDescriptionButton',
		'modifyListSelection',
		'deleteToDoNoteButton'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #initialization }
ToDoNoteView class >> with: aToDoNote [

	^ self new initializeWith: aToDoNote
]

{ #category : #creating }
ToDoNoteView >> createDeleteToDoNoteButton [

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

{ #category : #creating }
ToDoNoteView >> createLookDescriptionButton [

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

{ #category : #creating }
ToDoNoteView >> createModifyListSelection [

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
ToDoNoteView >> initializeWith: aToDoNote [

	modelToRepresent := aToDoNote.
	lookDescriptionButton := self createLookDescriptionButton.
	modifyListSelection := self createModifyListSelection.
	deleteToDoNoteButton := self createDeleteToDoNoteButton.

	toDoNoteView := ContainerWebView
		                wrapping: [ :canvas | 
			                canvas render:
				                '#' , aToDoNote identifier greaseString , ' '.
			                canvas render:
				                aToDoNote category greaseString , ' '.
			                canvas render: lookDescriptionButton.
			                canvas render: modifyListSelection.
			                canvas render: deleteToDoNoteButton ]
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
					                height: 100 px;
					                fontSize: 30 px;	
					                width: 370 px;
					                margin: 10 px ] ]
]

{ #category : #rendering }
ToDoNoteView >> renderContentOn: aRenderer [

	aRenderer render: toDoNoteView
]
