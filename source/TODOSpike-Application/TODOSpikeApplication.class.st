Class {
	#name : #TODOSpikeApplication,
	#superclass : #WillowApplication,
	#instVars : [
		'subjectField',
		'messageField'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #accessing }
TODOSpikeApplication class >> applicationTitle [
 ^ 'TODOSpike'
]

{ #category : #accessing }
TODOSpikeApplication class >> handlerName [

	^ 'home'
]

{ #category : #'server operations' }
TODOSpikeApplication class >> startAsDevelopment [

	(ZnZincServerAdaptor port: 8080) start.
	self registerAsDevelopmentApplication
]

{ #category : #'server operations' }
TODOSpikeApplication class >> stop [

	self unregisterFromApplications.
	(ZnZincServerAdaptor port: 8080) stop.
]

{ #category : #accessing }
TODOSpikeApplication >> componentSupplierForApplication [

	 ^ Bootstrap3ComponentSupplier online
]

{ #category : #accessing }
TODOSpikeApplication >> contentView [

	^ [ :aMainView | 
	  self
		  renderWebAppInstructionsAndAddFormOn: aMainView;
		  renderPrincipalContentOn: aMainView;
		  renderSendingReportBoxOn: aMainView ]
]

{ #category : #accessing }
TODOSpikeApplication >> jQueryLibrary [
  ^ JQuery3OnlineLibrary default
]

{ #category : #rendering }
TODOSpikeApplication >> renderPrincipalContentOn: aMainView [

	| principalContent |
	principalContent := ContainerWebView
		                    wrapping: ColumnListsView new
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
					                    display: 'inline-flex';
					                    height: 'max-content';
					                    fontSize: 20 px;
					                    width: 'max-content';
					                    margin: 20 px ] ].
	aMainView render: principalContent
]

{ #category : #rendering }
TODOSpikeApplication >> renderSendingReportBoxOn: aMainView [

	| sendingReportBox |
	
	aMainView render: (ToDoNoteView with: (ToDoNote identifiedBy: 1 described: 'Description' categorized: 'Test' endingOn: '25/09/2022' assignedTo: 'Agustin' withStatus: 'Open' )).
	aMainView render: sendingReportBox
]

{ #category : #rendering }
TODOSpikeApplication >> renderWebAppInstructionsAndAddFormOn: aMainView [

	| contentInformationWebAndAddFormView |
	contentInformationWebAndAddFormView := ContainerWebView
		                                       wrapping:
		                                       ContentInformationWebAndAddFormView
			                                       new
		                                       intoElementBuiltUsing: [ 
		                                       :canvas | canvas div ]
		                                       applying: [ :theContainer | 
			                                       theContainer addClass willow.
			                                       theContainer setStyleTo: [ 
				                                       :style | 
				                                       style
					                                       backgroundColor:
						                                       '#	F3F3F3';
					                                       boxShadow:
						                                       '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
					                                       color: '#EE8625';
					                                       borderRadius: 10 px;
					                                       padding: 20 px;
					                                       display: 'inline-flex';
					                                       height: 420 px;
					                                       fontSize: 20 px;
					                                       width: 1360 px;
					                                       margin: 20 px ] ].
	aMainView render: contentInformationWebAndAddFormView
]
