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
		'optionalEditOptionsContainer'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'instance creation' }
CompleteDescriptionOfToDoView class >> withInformationOf: aToDo [

	^ self new initializeWithInformationOf: aToDo
]

{ #category : #'private - creating' }
CompleteDescriptionOfToDoView >> createCompleteDescriptionWrappingElements [

	toDo isOpen ifTrue: [ 
		optionalEditOptionsContainer := Optional containing:
			                                (EditOptionsOfToDoView forTheToDo:
				                                 toDo) ].

	^ ContainerWebView
		  wrapping: [ :canvas | 
			  canvas
				  render: titleView;
				  render: dateLabelView;
				  render: employeeLabelView;
				  render: descriptionTextView.
			  optionalEditOptionsContainer withContentDo: [
				  :editOptionsContainer | canvas render: editOptionsContainer ] ]
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
					  width: 900 px;
					  margin: 20 px ] ]
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

{ #category : #initialization }
CompleteDescriptionOfToDoView >> initializeWithInformationOf: aToDo [

	toDo := aToDo.
	titleView := self createTitleView.
	dateLabelView := self createDateLabel.
	employeeLabelView := self createEmployeeLabel.
	descriptionTextView := self createDescriptionText.
	optionalEditOptionsContainer := Optional unused.
	completeDescription := self createCompleteDescriptionWrappingElements
]

{ #category : #rendering }
CompleteDescriptionOfToDoView >> renderContentOn: aRenderer [

	aRenderer render: completeDescription
]
