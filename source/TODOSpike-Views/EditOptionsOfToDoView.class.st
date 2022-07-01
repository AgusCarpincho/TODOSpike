Class {
	#name : #EditOptionsOfToDoView,
	#superclass : #WAPainter,
	#instVars : [
		'editOptionsOfToDo',
		'toDo',
		'dateFieldWebView',
		'updateCompletionDateButton',
		'editOptionsTitle',
		'dateFieldLabel',
		'assignEmployeeSelectionButtonLabel',
		'assignEmployeeSelectionButton',
		'updateAssignedEmployeeButton'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #enumerating }
EditOptionsOfToDoView class >> forTheToDo: aToDo [


	^ self new initializeForTheToDo: aToDo
]

{ #category : #'private - creating' }
EditOptionsOfToDoView >> createAssignEmployeeSelectionButton [

	assignEmployeeSelectionButton := SingleSelectionWebView
		                                 dropDownListApplying: [ :dropdown | 
			                                 dropdown addClass willow.
			                                 dropdown setStyleTo: [ :style | 
				                                 style
					                                 width: 120 px;
					                                 height: 30 px;
					                                 marginLeft: 20 px ] ]
		                                 applyingToOptions: [ :option :item | 
		                                  ].
	
	assignEmployeeSelectionButton allowAnyOf:
		self session applicationContext repositorySystem employeeNames.
]

{ #category : #'private - creating' }
EditOptionsOfToDoView >> createAssignEmployeeSelectionButtonLabel [

	assignEmployeeSelectionButtonLabel := HeadingWebView
		                                      displaying: 'Assigned to:'
		                                      withLevel: 3
		                                      applying: [ :canvas | 
			                                      canvas setStyleTo: [ :style | 
				                                      style
					                                      color: #black;
					                                      fontFamily: #Roboto;
					                                      marginLeft: 20 px;
					                                      height: 20 px;
					                                      marginTop: 10 px ] ]
]

{ #category : #'private - creating' }
EditOptionsOfToDoView >> createDateFieldLabel [

	dateFieldLabel := HeadingWebView
		                  displaying: 'Change date to: '
		                  withLevel: 3
		                  applying: [ :completionDate | 
			                  completionDate setStyleTo: [ :style | 
				                  style
					                  color: #black;
					                  fontFamily: #Roboto;
					                  margin: 10 px;
					                  height: 20 px;
					                  marginTop: 30 px;
					                  marginLeft: 20 px ] ]
]

{ #category : #'private - creating' }
EditOptionsOfToDoView >> createDateFieldWebView [

	dateFieldWebView := DateFieldWebView applying: [ :field | 
		  field setStyleTo: [ :style | style marginLeft: 20 px ] ]
]

{ #category : #'private - creating' }
EditOptionsOfToDoView >> createEditSectionView [

	self createTitle.
	self createDateFieldWebView.
	self createDateFieldLabel.
	self createUpdateCompletionDateButton.
	self createAssignEmployeeSelectionButtonLabel.
	self createAssignEmployeeSelectionButton.
	self createUpdateAssignedEmployeeButton.
	^ ContainerWebView
		  wrapping: [ :canvas | 
			  canvas
				  render: editOptionsTitle;
				  render: dateFieldLabel;
				  render: dateFieldWebView;
				  render: updateCompletionDateButton;
				  render: assignEmployeeSelectionButtonLabel;
				  render: assignEmployeeSelectionButton;
				  render: updateAssignedEmployeeButton ]
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
					  height: 280 px;
					  display: 'inline-block';
					  fontSize: 20 px;
					  width: 850 px;
					  margin: 5 px ] ]
]

{ #category : #'private - creating' }
EditOptionsOfToDoView >> createTitle [

	editOptionsTitle := HeadingWebView
		                    displaying: 'Edit options'
		                    withLevel: 1
		                    applying: [ :descriptionText | 
			                    descriptionText setStyleTo: [ :style | 
				                    style
					                    color: #black;
					                    fontFamily: #Roboto;
					                    margin: 20 px;
					                    height: 20 px;
					                    marginTop: 10 px ] ]
]

{ #category : #'private - creating' }
EditOptionsOfToDoView >> createUpdateAssignedEmployeeButton [

	updateAssignedEmployeeButton := self componentSupplier
		                                asynchronicButtonLabeled: 'Update'
		                                applying: [ :canvas | 
			                                canvas setStyleTo: [ :button | 
				                                button
					                                height: 40 px;
					                                width: 100 px;
					                                marginRight: 10 px;
					                                fontFamily: 'Roboto';
					                                fontWeight: #bold;
					                                fontSize: 20 px;
					                                border: 'None';
					                                borderColor: 'grey';
					                                borderWidth: 2 px;
					                                borderRadius: 10 px ] ]
]

{ #category : #'private - creating' }
EditOptionsOfToDoView >> createUpdateCompletionDateButton [

	updateCompletionDateButton :=  self componentSupplier
		  asynchronicButtonLabeled: 'Update'
		  applying: [ :canvas | 
			  canvas setStyleTo: [ :button | 
				  button
					  height: 40 px;
					  width: 100 px;
					  marginRight: 10 px;
					  fontFamily: 'Roboto';
					  fontWeight: #bold;
					  fontSize: 20 px;
					  border: 'None';
					  borderColor: 'grey';
					  borderWidth: 2 px;
					  borderRadius: 10 px ] ]
]

{ #category : #initialization }
EditOptionsOfToDoView >> initializeForTheToDo: aToDo [

	toDo := aToDo.
	editOptionsOfToDo := self createEditSectionView
]

{ #category : #rendering }
EditOptionsOfToDoView >> renderContentOn: aRenderer [

	self configureTriggers.
	aRenderer render: editOptionsOfToDo
]
