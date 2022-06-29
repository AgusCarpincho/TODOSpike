Class {
	#name : #ToDoBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'toDoBuilder'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoBuilderTest >> setUp [

	super setUp.

	toDoBuilder := ToDoBuilder
		               withNumericalIdentifier: 1
		               withDescription: 'A good description'
]

{ #category : #creation }
ToDoBuilderTest >> test01AToDoNoteBuilderCantBeCreatedIfTheIdentifierIIsANonNumericalObjectAndAnExceptionIsRaised [

	self
		should: [ 
			ToDoBuilder
				withNumericalIdentifier: nil
				withDescription: 'A good description' ]
		raise: ToDoException
]

{ #category : #building }
ToDoBuilderTest >> test02AToDoNoteBuilderWithANumericalIdentifierAndADescriptionConfiguredBuildAToDoNoteAndDontRaiseAnException [

	self shouldnt: [ toDoBuilder build ] raise: ToDoException
]

{ #category : #building }
ToDoBuilderTest >> test03AToDoNoteBuilderWithANumericalIdentifierAndADescriptionConfiguredBuildsAToDoNoteWithANumericalIdentifierAndADescription [

	| aToDoNote |
	self shouldnt: [ toDoBuilder build ] raise: ToDoException.

	aToDoNote := toDoBuilder build.

	self assert: aToDoNote description equals: 'A good description'.
	self assert: aToDoNote identifier equals: 1.
]

{ #category : #building }
ToDoBuilderTest >> test04AToDoNoteBuilderWithANumericalIdentifierAndADescriptionAndACategoryConfiguredBuildsAToDoNoteWithANumericalIdentifierAndADescriptionAndACategory [

	| aToDoNote |
	toDoBuilder configuringCategory: 'Development'.

	self shouldnt: [ toDoBuilder build ] raise: ToDoException.
	aToDoNote := toDoBuilder build.

	self assert: aToDoNote description equals: 'A good description'.
	self assert: (aToDoNote category equalsTo: (Optional containing: 'Development'))
]

{ #category : #building }
ToDoBuilderTest >> test05AToDoNoteBuilderWithAllNecessaryConfigurationBuildsAToDoNoteWithoutAnAssignedEmployee [

	| aToDoNote |

	toDoBuilder configuringCategory: 'Development'.
	toDoBuilder configuringCompletionDate: '1/1/2023'.
	toDoBuilder configuringAssignedEmployee: 'Agustin'.

	self shouldnt: [ toDoBuilder build ] raise: ToDoException.
	aToDoNote := toDoBuilder build.

	self assert: aToDoNote description equals: 'A good description'.
	self assert: (aToDoNote category equalsTo: (Optional containing: 'Development')).

	aToDoNote completionDate withContentDo: [ :completionDate | 
		self assert: (completionDate sameAs: '1/1/2023') ].

	aToDoNote designatedEmployee withContentDo: [ :designatedEmployeeContent | self assert: designatedEmployeeContent equals: 'Agustin']
]

{ #category : #building }
ToDoBuilderTest >> test07AToDoNoteBuilderMustBeInstantiatedWithAByteStringDescriptionAndMusntBeEmpty [

	self
		shouldnt: [ 
			ToDoBuilder
				withNumericalIdentifier: 1
				withDescription: 'A good description' ]
		raise: ToDoException.

	self
		should: [
		ToDoBuilder withNumericalIdentifier: 1 withDescription: 2 ]
		raise: ToDoException
]
