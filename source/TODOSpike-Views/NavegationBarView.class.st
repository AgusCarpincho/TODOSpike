"
This is a visual component that allow the user interact with the content of the web app
switching between parts of the web app through the buttons
 
Internal Representation and Key Implementation Points.

    Instance Variables
	addEmployeeButton:		<Object>
	addToDoButton:		<Object>
	informationButton:		<Object>
	navbar:		<Object>
	showEmployeesButton:		<Object>
	showToDosButton:		<Object>


    Implementation Points
"
Class {
	#name : #NavegationBarView,
	#superclass : #WAPainter,
	#instVars : [
		'navbar',
		'showToDosButton',
		'addToDoButton',
		'informationButton',
		'addEmployeeButton',
		'showEmployeesButton'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #configuring }
NavegationBarView >> configureTriggerOf: aButtonWebView toRender: aWebView [

	aButtonWebView on trigger
		
		serverDo: [ 
			self session applicationContext configuringCurrentWebViewTo:
					aWebView ];render: self session applicationContext identifiedCurrentWebView
]

{ #category : #configuring }
NavegationBarView >> configureTriggers [

	self
		configureTriggerOf: informationButton
		toRender: WelcomeWebView new;
		configureTriggerOf: showToDosButton toRender: ToDosWebView new;
		configureTriggerOf: addToDoButton toRender: ToDoAddFormView new;
		configureTriggerOf: addEmployeeButton
		toRender: EmployeeAddFormView new;configureTriggerOf: showEmployeesButton
		toRender: EmployeesWebView new.


	showToDosButton on trigger serverDo: [ 
		self session applicationContext configuringCurrentWebViewTo:
			ToDosWebView new ].
	addToDoButton on trigger serverDo: [ 
		self session applicationContext configuringCurrentWebViewTo:
			ToDoAddFormView new ].
	addEmployeeButton on trigger serverDo: [ 
		self session applicationContext configuringCurrentWebViewTo:
			EmployeeAddFormView new ]
]

{ #category : #'private - creating' }
NavegationBarView >> createButtonLabeled: aLabel [

	^ self componentSupplier
		  asynchronicButtonLabeled: aLabel
		  applying: [ :theButton | 
			  theButton setStyleTo: [ :style | 
				  style
					  height: 50 px;
					  width: 210 px;
					  marginRight: 10 px;
					  fontFamily: 'Roboto';
					  fontWeight: #bold;
					  fontSize: 25 px;
					  border: 'None';
					  borderColor: 'grey';
					  borderWidth: 2 px;
					  borderRadius: 10 px ] ]
]

{ #category : #initialization }
NavegationBarView >> initialize [

	informationButton := self createButtonLabeled: 'Home'.
	showToDosButton := self createButtonLabeled: 'Show ToDos'.
	addToDoButton := self createButtonLabeled: 'Add ToDo'.
	addEmployeeButton := self createButtonLabeled: 'Add Employee'.
	showEmployeesButton := self createButtonLabeled: 'Show Employees'.

	navbar := ContainerWebView
		          wrapping: [ :canvas | 
			          canvas
				          render: informationButton;
				          render: showToDosButton;
				          render: showEmployeesButton;
				          render: addToDoButton;
				          render: addEmployeeButton ]
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
					          height: 90 px;
					          fontSize: 20 px;
					          width: 2000 px;
					          margin: 20 px ] ]
]

{ #category : #rendering }
NavegationBarView >> renderContentOn: aRenderer [

	self configureTriggers.
	aRenderer
		render: navbar
]
