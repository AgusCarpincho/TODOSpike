Class {
	#name : #ToDoNoteBuilderConfigureMethodsAndBuildsTests,
	#superclass : #TestCase,
	#instVars : [
		'toDoBuilderWithoutIdentifier',
		'toDoBuilder'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoNoteBuilderConfigureMethodsAndBuildsTests >> setUp [
	super setUp.
	
	toDoBuilderWithoutIdentifier := ToDoNoteBuilder withNumericalIdentifier: nil.
	toDoBuilder := ToDoNoteBuilder withNumericalIdentifier: 1.
]

{ #category : #tests }
ToDoNoteBuilderConfigureMethodsAndBuildsTests >> test01AToDoNoteBuilderDoesntBuildsAnythingIfItIsNotConfiguredAndRaiseAnException [

	self should: [toDoBuilderWithoutIdentifier build] raise: ToDoNoteException
]

{ #category : #tests }
ToDoNoteBuilderConfigureMethodsAndBuildsTests >> test02AToDoNoteBuilderWithANumericalIdentifierConfiguredButWithoutAnyOtherConfiguredAtributeDoesntBuildAnythingAndRaiseAnException [

	self should: [toDoBuilder build] raise: ToDoNoteException
]

{ #category : #tests }
ToDoNoteBuilderConfigureMethodsAndBuildsTests >> test03AToDoNoteBuilderWithANumericalIdentifierAndADescriptionConfiguredBuildsAToDoNoteWithANumericalIdentifierAndADescription [

	| aToDoNote |
	
	toDoBuilder configuringDescription: 'A good description'.
	
	self shouldnt: [ toDoBuilder build ] raise: ToDoNoteException.
	
	aToDoNote := toDoBuilder build.
	
	self assert: aToDoNote description equals: 'A good description'
]

{ #category : #tests }
ToDoNoteBuilderConfigureMethodsAndBuildsTests >> test04AToDoNoteBuilderWithANumericalIdentifierAndADescriptionAndACategoryConfiguredBuildsAToDoNoteWithANumericalIdentifierAndADescriptionAndACategory [

	| aToDoNote |
	toDoBuilder configuringDescription: 'A good description'.
	toDoBuilder configuringCategory: 'Development'.
	
	self shouldnt: [ toDoBuilder build ] raise: ToDoNoteException.
	aToDoNote := toDoBuilder build.

	self assert: aToDoNote description equals: 'A good description'.
	self assert: aToDoNote category equals: 'Development'.
]

{ #category : #tests }
ToDoNoteBuilderConfigureMethodsAndBuildsTests >> test05AToDoNoteBuilderWithAllNecessaryConfigurationBuildsAToDoNoteWithoutAnAssignedEmployee [

	| aToDoNote |
	toDoBuilder configuringDescription: 'A good description'.
	toDoBuilder configuringCategory: 'Development'.
	toDoBuilder configuringCompletionDate: '1/1/2023'.
	toDoBuilder configuringAssignedEmployee: 'Agustin'.

	self shouldnt: [ toDoBuilder build ] raise: ToDoNoteException.
	aToDoNote := toDoBuilder build.

	self assert: aToDoNote description equals: 'A good description'.
	self assert: aToDoNote category equals: 'Development'.
	self assert: aToDoNote completionDate equals: '1/1/2023'.
	self assert: aToDoNote designatedEmployee equals: 'Agustin'
]

{ #category : #tests }
ToDoNoteBuilderConfigureMethodsAndBuildsTests >> test06AToDoNoteIsBuildedAlwaysWithOpenCompletionStatus [

	toDoBuilder configuringDescription: 'A good description'.
	self
		assert: toDoBuilder build isOpen
]
