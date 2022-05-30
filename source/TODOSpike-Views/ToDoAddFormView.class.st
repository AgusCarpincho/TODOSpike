Class {
	#name : #ToDoAddFormView,
	#superclass : #WAPainter,
	#instVars : [
		'toDoAddForm',
		'title',
		'categoryLabel',
		'categoryField',
		'descriptionLabel',
		'descriptionField',
		'addToDoButton'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #creating }
ToDoAddFormView >> createAddToDoButton [

	^ AsynchronicButtonWebView labeled: 'Add' applying: [ :canvas | 
		  canvas setStyleTo: [ :style | 
			  style
				  height: 50 px;
				  width: 100 px;
				  fontFamily: 'Roboto';
				  fontWeight: #bold;
				  fontSize: 25 px;
				  borderRadius: 10 px ] ]
]

{ #category : #creating }
ToDoAddFormView >> createCategoryField [
		
	^ TextFieldWebView singleLineApplying: [ :canvas | 
		  canvas setStyleTo: [ :style | 
			  style
				  margin: 20 px;
				  marginTop: 10 px;
				  borderRadius: 10 px ] ]
]

{ #category : #creating }
ToDoAddFormView >> createCategoryLabel [

	^ HeadingWebView
		  displaying: 'Category'
		  withLevel: 3
		  applying: [ :canvas | 
			  canvas setStyleTo: [ :style | 
				  style
					  color: #black;
					  fontFamily: #Roboto;
					  margin: 20 px;
					  height: 20 px;
					  marginTop: 10 px ] ]				
]

{ #category : #creating }
ToDoAddFormView >> createDescriptionField [

	^ TextFieldWebView singleLineApplying: [ :canvas | 
		  canvas setStyleTo: [ :style | 
			  style
				  height: 50 px;	
				  margin: 20 px;
				  marginTop: 5 px;
				  borderRadius: 10 px ] ]
]

{ #category : #creating }
ToDoAddFormView >> createDescriptionLabel [

	^ HeadingWebView
		  displaying: 'Description'
		  withLevel: 3
		  applying: [ :canvas | 
			  canvas setStyleTo: [ :style | 
				  style
					  color: #black;
					  fontFamily: #Roboto;
					  margin: 20 px;
					  height: 20 px;
					  marginTop: 10 px ] ]
]

{ #category : #creating }
ToDoAddFormView >> createTitle [

	^ HeadingWebView
		  displaying: 'Add new ToDo'
		  withLevel: 2
		  applying: [ :canvas | 
			  canvas setStyleTo: [ :style | 
				  style
					  color: #black;
					  fontFamily: #Roboto;
					  margin: 20 px;	
					  marginTop: 30 px ] ]
]

{ #category : #creating }
ToDoAddFormView >> createToDoAddFormWrapping [

	^ ContainerWebView
		  wrapping: [ :canvas | 
			  canvas
				  render: title;
				  render: categoryLabel;
				  render: categoryField;
				  render: descriptionLabel;
				  render: descriptionField;
				  render: addToDoButton ]
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
					  padding: 0 px;
					  display: 'inline-block';
					  height: 340 px;
					  fontSize: 20 px;
					  width: 1300 px;
					  margin: 20 px ] ]
]

{ #category : #initialization }
ToDoAddFormView >> initialize [

	title := self createTitle.

	categoryLabel := self createCategoryLabel.
	categoryField := self createCategoryField.

	descriptionLabel := self createDescriptionLabel.
	descriptionField := self createDescriptionField.

	addToDoButton := self createAddToDoButton.
	toDoAddForm := self createToDoAddFormWrapping
]

{ #category : #rendering }
ToDoAddFormView >> renderContentOn: aRenderer [

	aRenderer render: toDoAddForm
]
