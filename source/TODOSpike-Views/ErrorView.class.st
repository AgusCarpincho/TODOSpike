Class {
	#name : #ErrorView,
	#superclass : #WAPainter,
	#instVars : [
		'errorView',
		'errorMessageDescriptionText'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'instance creation' }
ErrorView class >> withErrorMessage: anErrorMessage [

 ^ self new initializeWithErrorMessage: anErrorMessage
]

{ #category : #initialization }
ErrorView >> initializeWithErrorMessage: anErrorMessage [

	errorMessageDescriptionText := HeadingWebView
		                               displaying: anErrorMessage
		                               withLevel: 2
		                               applying: [ :descriptionText | 
			                               descriptionText setStyleTo: [ :style | 
				                               style
					                               color: #white;
					                               fontFamily: #Roboto;
					                               fontSize: #bold;
					                               height: 20 px;
					                               margin: 5 px ] ].
	errorView := ContainerWebView
		             wrapping: [ :canvas | 
		             canvas render: errorMessageDescriptionText ]
		             intoElementBuiltUsing: [ :theContainer | 
		             theContainer div ]
		             applying: [ :theContainer | 
			             theContainer addClass willow.
			             theContainer setStyleTo: [ :style | 
				             style
					             backgroundColor: '#D33E3E';
					             boxShadow:
						             '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
					             color: 'white';
					             fontSize: 'bold';
					             borderRadius: 10 px;
					             padding: 20 px;
					             height: 100 px;
					             display: 'inline-block';
					             fontSize: 20 px;
					             width: 900 px;
					             margin: 20 px ] ]
]

{ #category : #rendering }
ErrorView >> renderContentOn: aRenderer [
	
	aRenderer render: errorView
]
