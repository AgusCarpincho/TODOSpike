Class {
	#name : #EmployeeAddFormView,
	#superclass : #WAPainter,
	#instVars : [
		'title',
		'employeeDescriptionLabel',
		'employeeNameField',
		'addEmployeeFormButton',
		'addEmployeeForm',
		'contentOfEmployeeNameField'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #configuring }
EmployeeAddFormView >> configureTriggers [

	employeeNameField on trigger serverDo: [ 
		contentOfEmployeeNameField := employeeNameField model ].
	
	addEmployeeFormButton on trigger
		serverDo: [ 
			self session applicationContext repositorySystem addEmployeeName:
					contentOfEmployeeNameField.
			self session applicationContext configuringCurrentWebViewTo:
					EmployeesWebView new ];
		render: self session applicationContext identifiedCurrentWebView
]

{ #category : #'private - creating' }
EmployeeAddFormView >> createAddEmployeeForm [

	^ ContainerWebView
		  wrapping: [ :canvas | 
			  canvas
				  render: title;
				  render: employeeDescriptionLabel;
				  render: employeeNameField;
				  render: addEmployeeFormButton ]
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
					  height: 255 px;
					  fontSize: 20 px;
					  width: 400 px;
					  margin: 20 px ] ]
]

{ #category : #'private - creating' }
EmployeeAddFormView >> createAddEmployeeFormButton [

	^ self componentSupplier
		  asynchronicButtonLabeled: 'Add'
		  applying: [ :canvas | 
			  canvas setStyleTo: [ :button | 
				  button
					  height: 50 px;
					  width: 170 px;
					  marginLeft: 20 px;
					  fontFamily: 'Roboto';
					  fontWeight: #bold;
					  fontSize: 25 px;
					  border: 'None';
					  borderColor: 'grey';
					  borderWidth: 2 px;
					  borderRadius: 10 px ] ]
]

{ #category : #'private - creating' }
EmployeeAddFormView >> createEmployeeDescriptionLabel [

	^ HeadingWebView
		  displaying: 'Employee name'
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

{ #category : #'private - creating' }
EmployeeAddFormView >> createEmployeeNameField [

	^ TextFieldWebView singleLineApplying: [ :canvas | 
		  canvas setStyleTo: [ :style | 
			  style
				  margin: 20 px;
				  marginTop: 10 px;
				  borderRadius: 10 px ] ].
]

{ #category : #'private - creating' }
EmployeeAddFormView >> createTitle [

	^ HeadingWebView
		         displaying: 'Add new employee'
		         withLevel: 2
		         applying: [ :canvas | 
			         canvas setStyleTo: [ :style | 
				         style
					         color: #black;
					         fontFamily: #Roboto;
					         margin: 20 px;
					         marginTop: 30 px ] ]
]

{ #category : #initialization }
EmployeeAddFormView >> initialize [

	title := self createTitle.
	employeeDescriptionLabel := self createEmployeeDescriptionLabel.
	employeeNameField := self createEmployeeNameField.
	addEmployeeFormButton := self createAddEmployeeFormButton.
	addEmployeeForm := self createAddEmployeeForm.
]

{ #category : #rendering }
EmployeeAddFormView >> renderContentOn: aRenderer [

	self configureTriggers.
	aRenderer render: addEmployeeForm
]
