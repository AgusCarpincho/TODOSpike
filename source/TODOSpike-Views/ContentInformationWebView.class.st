Class {
	#name : #ContentInformationWebView,
	#superclass : #WAPainter,
	#instVars : [
		'title',
		'contentInformation'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #initialization }
ContentInformationWebView >> initialize [

	title := HeadingWebView
		         displaying: 'TODOSpike Instructions'
		         withLevel: 1
		         applying: [ :canvas | 
			         canvas setStyleTo: [ :style | 
				         style
					         color: #black;
					         fontFamily: #Roboto;
					         margin: 20 px;
					         marginTop: 20 px ] ].
	contentInformation := HeadingWebView
		                      displaying:
		                      'Welcome to TODOSpike, this is a web app using Willow with Pharo 10. If you want to add some ToDo you need to do it using the Add ToDo	 button. The ToDos will have appear in the page when click on Show ToDos button. Thanks for using TODOSpike !'
		                      withLevel: 2
		                      applying: [ :canvas | 
			                      canvas setStyleTo: [ :style | 
				                      style
					                      color: '#EE8625';
					                      fontFamily: #Roboto;
					                      margin: 20 px ] ]
]

{ #category : #rendering }
ContentInformationWebView >> renderContentOn: aRenderer [

	| containerInformation |
	containerInformation := ContainerWebView
		                        wrapping: [ :canvas | 
			                        canvas render: title.
			                        canvas render: contentInformation ]
		                        intoElementBuiltUsing: [ :canvas | 
		                        canvas div ]
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
					                        height: 340 px;
					                        fontSize: 20 px;
					                        width: 1360 px;
					                        margin: 20 px ] ].
	aRenderer render: containerInformation
]
