Class {
	#name : #CompleteDescriptionOfToDoView,
	#superclass : #WAPainter,
	#instVars : [
		'completeDescription',
		'dateLabelView',
		'employeeLabelView',
		'descriptionTextView',
		'toDo',
		'titleView',
		'dateFieldWebView',
		'updateCompletionDateButton',
		'editOptionsContainer',
		'editOptionsTitle'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'instance creation' }
CompleteDescriptionOfToDoView class >> withInformationOf: aToDo [

	^ self new initializeWithInformationOf: aToDo
]

{ #category : #'private - creating' }
CompleteDescriptionOfToDoView >> configureTriggers [

	dateFieldWebView on trigger serverDo: [  ].

	updateCompletionDateButton on trigger
		serverDo: [ 
			[self session applicationContext repositorySystem
				modifyTheToDoIdentified: toDo identifier
				withTheNewCompletionDate: dateFieldWebView date]on: Error do: [].
			self session applicationContext configuringCurrentWebViewTo:
					(CompleteDescriptionOfToDoView withInformationOf: toDo) ];
		render: self session applicationContext identifiedCurrentWebView
]

{ #category : #'private - creating' }
CompleteDescriptionOfToDoView >> createCompleteDescriptionWrappingElements [

	editOptionsTitle := HeadingWebView
		                    displaying: 'Edit'
		                    withLevel: 1
		                    applying: [ :descriptionText | 
			                    descriptionText setStyleTo: [ :style | 
				                    style
					                    color: #black;
					                    fontFamily: #Roboto;
					                    margin: 20 px;
					                    height: 20 px;
					                    marginTop: 10 px ] ].
	editOptionsContainer := ContainerWebView
		                        wrapping: [ :canvas | 
			                        canvas
				                        render: editOptionsTitle;
				                        render: dateFieldWebView;
				                        render: updateCompletionDateButton ]
		                        intoElementBuiltUsing: [ :theContainer | 
		                        theContainer div ]
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
					                        width: 1250 px;
					                        margin: 5 px ] ].

	^ ContainerWebView
		  wrapping: [ :canvas | 
			  canvas render: titleView.
			  canvas render: dateLabelView.
			  canvas render: employeeLabelView.
			  canvas render: descriptionTextView.
			  canvas render: editOptionsContainer ]
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
					  height: 500 px;
					  display: 'inline-block';
					  fontSize: 20 px;
					  width: 1300 px;
					  margin: 20 px ] ]
]

{ #category : #'private - creating' }
CompleteDescriptionOfToDoView >> createDateFieldWebView [

	^ DateFieldWebView applying: [ :field | 
		  field setStyleTo: [ :style | style marginLeft: 20 px ] ]
]

{ #category : #'private - creating' }
CompleteDescriptionOfToDoView >> createDateLabel [

	^ HeadingWebView
		  displaying:
		  ('Completion date until expires: {1}' format:
			   { toDo completionDate })
		  withLevel: 3
		  applying: [ :completionDate | 
			  completionDate setStyleTo: [ :style | 
				  style
					  color: #black;
					  fontFamily: #Roboto;
					  margin: 20 px;
					  height: 20 px;
					  marginTop: 10 px ] ]
]

{ #category : #'private - creating' }
CompleteDescriptionOfToDoView >> createDescriptionText [

	^ HeadingWebView
		  displaying:
		  ('Description: {1}' format: { toDo description })
		  withLevel: 2
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
CompleteDescriptionOfToDoView >> createEmployeeLabel [

	^ HeadingWebView
		  displaying: ('Assigned to the employee: {1}' format:
			   { toDo designatedEmployee })
		  withLevel: 3
		  applying: [ :designatedEmployee | 
			  designatedEmployee setStyleTo: [ :style | 
				  style
					  color: #black;
					  fontFamily: #Roboto;
					  margin: 20 px;
					  height: 20 px;
					  marginTop: 10 px ] ]
]

{ #category : #'private - creating' }
CompleteDescriptionOfToDoView >> createTitleView [

	| categoryContent |
	toDo category withContentDo: [ :theContent | 
		categoryContent := theContent ].

	^ HeadingWebView
		  displaying:
		  'ToDo #' , toDo identifier greaseString
		  ,' ', categoryContent greaseString
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
CompleteDescriptionOfToDoView >> createUpdateCompletionDateButton [

	^ self componentSupplier
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
CompleteDescriptionOfToDoView >> initializeWithInformationOf: aToDo [

	toDo := aToDo.
	titleView := self createTitleView.
	dateLabelView := self createDateLabel.
	dateFieldWebView := self createDateFieldWebView.
	updateCompletionDateButton := self createUpdateCompletionDateButton.
	employeeLabelView := self createEmployeeLabel.
	descriptionTextView := self createDescriptionText.
	completeDescription := self createCompleteDescriptionWrappingElements.
]

{ #category : #rendering }
CompleteDescriptionOfToDoView >> renderContentOn: aRenderer [

	self configureTriggers.
	aRenderer render: completeDescription
]
