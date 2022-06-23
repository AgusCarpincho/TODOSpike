Class {
	#name : #NavBarView,
	#superclass : #WAPainter,
	#instVars : [
		'navbar',
		'showToDosButton',
		'addToDoButton',
		'informationButton'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'as yet unclassified' }
NavBarView >> buttonLabeled: aLabel [

	^ self componentSupplier
		  asynchronicButtonLabeled: aLabel
		  applying: [ :theButton | 
			  theButton setStyleTo: [ :style | 
				  style
					  height: 50 px;
					  width: 170 px;
					  marginRight: 10 px;
					  fontFamily: 'Roboto';
					  fontWeight: #bold;
					  fontSize: 25 px;
					  border: 'solid';		
					  borderColor: 'grey';
					  borderWidth: 2 px;
					  borderRadius: 10 px ] ]
]

{ #category : #'as yet unclassified' }
NavBarView >> configureTriggerOf: aButtonWebView toRender: aWebView [

	aButtonWebView on trigger
		serverDo: [ self session applicationContext settingCurrentWebViewTo: aWebView ];
		render: self session applicationContext identifiedCurrentWebView
]

{ #category : #'as yet unclassified' }
NavBarView >> configureTriggers [

	self
		configureTriggerOf: informationButton
		toRender: ContentInformationWebView new;		
		configureTriggerOf: showToDosButton
		toRender: (PrincipalContentView withRepositorySystem:
					 self session applicationContext repositorySystem);		
		configureTriggerOf: addToDoButton
		toRender: (ToDoAddFormView withRepositorySystem:
					 self session applicationContext repositorySystem)
]

{ #category : #initialization }
NavBarView >> initialize [

	informationButton := self buttonLabeled: 'Info'.
	showToDosButton := self buttonLabeled: 'Show ToDos'.
	addToDoButton := self buttonLabeled: 'Add ToDo'.



	navbar := ContainerWebView
		          wrapping: [ :canvas | 
			canvas render: informationButton.
			          canvas render: showToDosButton.
			          canvas render: addToDoButton ]
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
NavBarView >> renderContentOn: aRenderer [

	self configureTriggers.
	aRenderer render: navbar
]
