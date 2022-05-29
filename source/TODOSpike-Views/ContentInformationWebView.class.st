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
		         withLevel: 2
		         applying: [ :canvas | 
			         canvas setStyleTo: [ :style | 
				         style
					         color: #black;
					         fontFamily: #Roboto;
					         margin: 20 px;
					         marginTop: 30 px ] ].
	contentInformation := 'Welcome to TODOSpike, this is a web app using Willow with Pharo 10. If you want to add some ToDo you need to do it using the right form. The ToDos will have appear in the correct list column below. Thanks for using TODOSpike !'
]

{ #category : #rendering }
ContentInformationWebView >> renderContentOn: aRenderer [

	aRenderer render: title.
	aRenderer render: contentInformation
]
