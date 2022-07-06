Class {
	#name : #WelcomeWebView,
	#superclass : #WAPainter,
	#instVars : [
		'title',
		'welcomeContentLabel'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #initialization }
WelcomeWebView >> initialize [

	title := HeadingWebView
		         displaying: 'Welcome to TODOSpike !'
		         withLevel: 1
		         applying: [ :canvas | 
			         canvas setStyleTo: [ :style | 
				         style
					         color: #black;
					         fontFamily: #Roboto;
					         margin: 20 px;
					         marginTop: 20 px ] ].
	welcomeContentLabel := HeadingWebView
		                       displaying:
		                       'This is a web app using Willow with Pharo 10. You can navigate with the upper navigation bar, feel to use it as you want. Thanks for using TODOSpike !'
		                       withLevel: 2
		                       applying: [ :canvas | 
			                       canvas setStyleTo: [ :style | 
				                       style
					                       color: '#EE8625';
					                       fontFamily: #Roboto;
					                       margin: 20 px;
					                       width: 1000 px ] ]
]

{ #category : #rendering }
WelcomeWebView >> renderContentOn: aRenderer [

	| welcomeWebView |
	welcomeWebView := ContainerWebView
		                        wrapping: [ :canvas | 
			                        canvas render: title.
			                        canvas render: welcomeContentLabel ]
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
	aRenderer render: welcomeWebView
]
