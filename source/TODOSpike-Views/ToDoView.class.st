Class {
	#name : #ToDoView,
	#superclass : #WAPainter,
	#instVars : [
		'lookDescriptionButton',
		'modifyListSelection',
		'toDoView',
		'deleteToDoButton',
		'toDo'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #initialization }
ToDoView class >> with: aToDoNote [

	^ self new initializeWith: aToDoNote
]

{ #category : #rendering }
ToDoView >> configureTriggers [

	deleteToDoButton on trigger
		serverDo: [ 
			self session applicationContext repositorySystem deleteToDoIdentified: toDo identifier.
			self session applicationContext
				configuringCurrentWebViewTo: ToDosWebView new.
				];
		render: self session applicationContext identifiedCurrentWebView
]

{ #category : #'private - creating' }
ToDoView >> createDeleteToDoButton [

	^ self componentSupplier
		  asynchronicButtonLabeled: 'X'
		  applying: [ :button |
			  button addClass bootstrap3 buttonDanger ]
]

{ #category : #'private - creating' }
ToDoView >> createLookDescriptionButton [

	^ self componentSupplier
		  asynchronicButtonLabeled: 'i'
		  applying: [ :button | button addClass bootstrap3 buttonPrimary ]
]

{ #category : #'private - creating' }
ToDoView >> createModifyListSelection [

	^ self componentSupplier
		  asynchronicButtonLabeled: 'Edit'
		 applying: [ :button | button addClass bootstrap3 buttonPrimary ]
]

{ #category : #'initialization - private' }
ToDoView >> initializeWith: aToDo [

	lookDescriptionButton := self createLookDescriptionButton.
	modifyListSelection := self createModifyListSelection.
	deleteToDoButton := self createDeleteToDoButton.
	toDo := aToDo.
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
					            color: '#black';
					            borderRadius: 10 px;
					            padding: 10 px;
					            display: 'inline-block';
					            height: 60 px;
					            fontSize: 20 px;
					            width: 370 px;
					            margin: 5 px ] ]
]

{ #category : #rendering }
ToDoView >> renderContentOn: aRenderer [

	self configureTriggers.
	aRenderer render: toDoView
]
