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
		  renderAddToDoFormOn: aMainView;
		  renderWebAppInstructionsOn: aMainView;
		  renderLeftToDoListColumnViewOn: aMainView;
		  renderMiddleToDoListColumnViewOn: aMainView;
		  renderRightToDoListColumnViewOn: aMainView;
		  renderSendingReportBoxOn: aMainView ]
]

{ #category : #accessing }
TODOSpikeApplication >> jQueryLibrary [
  ^ JQuery3OnlineLibrary default
]

{ #category : #rendering }
TODOSpikeApplication >> renderAddToDoFormOn: aMainView [

	| toDoAddForm |
	
	
	
	aMainView render: toDoAddForm
]

{ #category : #rendering }
TODOSpikeApplication >> renderLeftToDoListColumnViewOn: aMainView [

	| leftColumnToDoList |
	
	
	
	aMainView render: leftColumnToDoList
]

{ #category : #rendering }
TODOSpikeApplication >> renderMiddleToDoListColumnViewOn: aMainView [

	| middleColumnToDoList |
	aMainView render: middleColumnToDoList
]

{ #category : #rendering }
TODOSpikeApplication >> renderRightToDoListColumnViewOn: aMainView [

	| rightColumnToDoList |
	aMainView render: rightColumnToDoList
]

{ #category : #rendering }
TODOSpikeApplication >> renderSendingReportBoxOn: aMainView [

	| sendingReportBox |
	
	
	aMainView render: sendingReportBox
]

{ #category : #rendering }
TODOSpikeApplication >> renderWebAppInstructionsOn: aMainView [

	| webAppInstructions |
	webAppInstructions := WebAppInstructionsView
		                      wrapping: [ :canvas | 
		                      canvas render: 'TODOSpike Instructions' ]
		                      intoElementBuiltUsing: [ :canvas | canvas div ]
		                      applying: [ :field | 
			                      field setStyleTo: [ :style | 
				                      style
					                      backgroundColor: '#7E7B7A';
					                      color: #white;
					                      fontWeight: #bold;
					                      margin: 20 px ] ].
	aMainView render: webAppInstructions
]
