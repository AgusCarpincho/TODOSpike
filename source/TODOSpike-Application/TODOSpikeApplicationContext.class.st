Class {
	#name : #TODOSpikeApplicationContext,
	#superclass : #Object,
	#instVars : [
		'currentWebView',
		'repositorySystem',
		'principalWebView'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #'private - creating' }
TODOSpikeApplicationContext >> createContainerForContentInformationWebViewAndToDoAddFormView [

	^ ContainerWebView
		  wrapping: [ :canvas | 
			  canvas render: (ToDoAddFormView with: repositorySystem).
			  canvas render: ContentInformationWebView new ]
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
					  height: 420 px;
					  fontSize: 20 px;
					  width: 1360 px;
					  margin: 20 px ] ]
]

{ #category : #'private - creating' }
TODOSpikeApplicationContext >> createContainerViewForPrincipalContentView [

	^ ContainerWebView
		  wrapping: (PrincipalContentView withRepositorySystem: repositorySystem)
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
					  display: 'inline-flex';
					  height: 'max-content';
					  fontSize: 20 px;
					  width: 'max-content';
					  margin: 20 px ] ]
]

{ #category : #'private - creating' }
TODOSpikeApplicationContext >> createPrincipalWebView [

	principalWebView := self createContainerViewForPrincipalContentView
]

{ #category : #'private - creating' }
TODOSpikeApplicationContext >> createRepositorySystem [

	repositorySystem := RepositorySystem new
]

{ #category : #accessing }
TODOSpikeApplicationContext >> currentWebView [

	^ currentWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> identifiedCurrentWebView [

	^ principalWebView identifiedCurrentWebView
]

{ #category : #initialization }
TODOSpikeApplicationContext >> initialize [

	super initialize.
	self
		createRepositorySystem;
		setCurrentWebViewTo:
			self createContainerForContentInformationWebViewAndToDoAddFormView;
		createPrincipalWebView
]

{ #category : #accessing }
TODOSpikeApplicationContext >> principalWebView [

	^ principalWebView
]

{ #category : #setting }
TODOSpikeApplicationContext >> setCurrentWebViewTo: aCurrentWebView [

	currentWebView := aCurrentWebView
]
