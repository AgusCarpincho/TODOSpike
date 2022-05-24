Class {
	#name : #ComponentExample,
	#superclass : #WAPainter,
	#instVars : [
		'subjectField',
		'messageField'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #initialization }
ComponentExample >> initialize [

	super initialize.
	subjectField := self componentSupplier singleLineTextFieldApplying: [:field | field setPlaceholderTo: 'johndoe@example.com'].
	subjectField on trigger serializeIt.
	messageField := self componentSupplier multiLineTextFieldApplying: [ 
		                 ].
	messageField on trigger serializeIt
]

{ #category : #rendering }
ComponentExample >> renderContentOn: html [

		html render: subjectField .
		html break .
		html render: messageField .
]
