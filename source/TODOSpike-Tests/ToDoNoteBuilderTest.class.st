Class {
	#name : #ToDoNoteBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'toDoBuilder'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoNoteBuilderTest >> setUp [

	super setUp.
	
	toDoBuilder := ToDoNoteBuilder withNumericalIdentifier: 1.
]

{ #category : #creation }
ToDoNoteBuilderTest >> test01AToDoNoteBuilderCantBeCreatedIfTheIdentifierIIsANonNumericalObjectAndAnExceptionIsRaised [

	
	self should: [ToDoNoteBuilder withNumericalIdentifier: nil] raise: ToDoNoteException
]

{ #category : #building }
ToDoNoteBuilderTest >> test02AToDoNoteBuilderWithANumericalIdentifierAndADescriptionConfiguredBuildAToDoNoteAndDontRaiseAnException [

	self shouldnt: [ toDoBuilder build ] raise: ToDoNoteException
]

{ #category : #building }
ToDoNoteBuilderTest >> test03AToDoNoteBuilderWithANumericalIdentifierAndADescriptionConfiguredBuildsAToDoNoteWithANumericalIdentifierAndADescription [

	| aToDoNote |

	self shouldnt: [ toDoBuilder build ] raise: ToDoNoteException.

	aToDoNote := toDoBuilder build.

	self assert: aToDoNote description equals: 'A good description'
]

{ #category : #building }
ToDoNoteBuilderTest >> test04AToDoNoteBuilderWithANumericalIdentifierAndADescriptionAndACategoryConfiguredBuildsAToDoNoteWithANumericalIdentifierAndADescriptionAndACategory [

	| aToDoNote |
	toDoBuilder configuringCategory: 'Development'.

	self shouldnt: [ toDoBuilder build ] raise: ToDoNoteException.
	aToDoNote := toDoBuilder build.

	self assert: aToDoNote description equals: 'A good description'.
	self assert: (aToDoNote category equalsTo: (Optional containing: 'Development'))
]

{ #category : #building }
ToDoNoteBuilderTest >> test05AToDoNoteBuilderWithAllNecessaryConfigurationBuildsAToDoNoteWithoutAnAssignedEmployee [

	| aToDoNote |

	toDoBuilder configuringCategory: 'Development'.
	toDoBuilder configuringCompletionDate: '1/1/2023'.
	toDoBuilder configuringAssignedEmployee: 'Agustin'.

	self shouldnt: [ toDoBuilder build ] raise: ToDoNoteException.
	aToDoNote := toDoBuilder build.

	self assert: aToDoNote description equals: 'A good description'.
	self assert: (aToDoNote category equalsTo: (Optional containing: 'Development')).

	aToDoNote completionDate withContentDo: [ :completionDate | 
		self assert: (completionDate sameAs: '1/1/2023') ].

	aToDoNote designatedEmployee withContentDo: [ :designatedEmployeeContent | self assert: designatedEmployeeContent equals: 'Agustin']
]

{ #category : #building }
ToDoNoteBuilderTest >> test06AToDoNoteIsBuildedAlwaysWithOpenCompletionStatus [

	self assert: toDoBuilder build isOpen
]
