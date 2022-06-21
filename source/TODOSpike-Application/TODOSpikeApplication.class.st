Class {
	#name : #TODOSpikeApplication,
	#superclass : #WillowApplication,
	#instVars : [
		'repositorySystem',
		'principalContentView',
		'contentInformationWebAndAddFormView',
		'toDoAddFormView',
		'contentInformationWebView',
		'principalContentContainerWebView',
		'sendingReportBoxView'
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

{ #category : #accessing }
TODOSpikeApplication class >> sessionClass [

	^ TODOSpikeSession
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
			renderPrincipalContentOn: aMainView;
		  renderWebAppInstructionsAndAddFormOn: aMainView;
		  renderSendingReportBoxOn: aMainView ]
]

{ #category : #hooks }
TODOSpikeApplication >> initialRequest: request [

	super initialRequest: request
]

{ #category : #initialization }
TODOSpikeApplication >> initialize [

	super initialize.
	"Model"
	repositorySystem := RepositorySystem new.

	"Views"
	principalContentView := PrincipalContentView withRepositorySystem:
		                        repositorySystem.

	principalContentContainerWebView := ContainerWebView
		                                    wrapping: principalContentView
		                                    intoElementBuiltUsing: [ 
		                                    :theContainer | 
		                                    theContainer div ]
		                                    applying: [ :theContainer | 
			                                    theContainer addClass willow.
			                                    theContainer setStyleTo: [ 
				                                    :style | 
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

	toDoAddFormView := ToDoAddFormView
		                   with: repositorySystem
		                   rendering: principalContentContainerWebView. "Or principalContentView ?"

	contentInformationWebView := ContentInformationWebView new.

	contentInformationWebAndAddFormView := ContainerWebView
		                                       wrapping: [ :canvas | 
			                                       canvas render:
				                                       toDoAddFormView.
			                                       canvas render:
				                                       contentInformationWebView ]
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
	sendingReportBoxView := SendingReportBoxView new
]

{ #category : #accessing }
TODOSpikeApplication >> jQueryLibrary [
  ^ JQuery3OnlineLibrary default
]

{ #category : #rendering }
TODOSpikeApplication >> renderPrincipalContentOn: aMainView [

	aMainView render: principalContentContainerWebView
]

{ #category : #rendering }
TODOSpikeApplication >> renderSendingReportBoxOn: aMainView [

	aMainView render: sendingReportBoxView
]

{ #category : #rendering }
TODOSpikeApplication >> renderWebAppInstructionsAndAddFormOn: aMainView [

	aMainView render: contentInformationWebAndAddFormView
]
