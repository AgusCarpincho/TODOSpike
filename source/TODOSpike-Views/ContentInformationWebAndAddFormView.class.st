Class {
	#name : #ContentInformationWebAndAddFormView,
	#superclass : #WAPainter,
	#instVars : [
		'toDoAddForm',
		'contentInformationWeb'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'initialization - private' }
ContentInformationWebAndAddFormView >> initialize [ 

	toDoAddForm := ToDoAddFormView new.
	contentInformationWeb := ContentInformationWebView  new.
]

{ #category : #rendering }
ContentInformationWebAndAddFormView >> renderContentOn: aRenderer [

	aRenderer render: toDoAddForm.
	aRenderer render: contentInformationWeb.
]
