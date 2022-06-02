Class {
	#name : #AssignmentOfToDosToEmployeesTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
AssignmentOfToDosToEmployeesTests >> test01AToDoNoteCanBeAssignedToAnEmployee [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agustin'.

	self assert: aToDoNote designatedEmployee equals: 'Agustin'
]

{ #category : #tests }
AssignmentOfToDosToEmployeesTests >> test02AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsInProgress [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Tomas'.
		aToDoNote setCompletionStatusToInProgress .
	self
		should: [ aToDoNote assignTo: 'Tomas' ]
		raise: ToDoNoteException
]

{ #category : #tests }
AssignmentOfToDosToEmployeesTests >> test03AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsFinished [

	| aToDoNote |
	aToDoNote := ToDoNote
		             identifiedBy: 1
		             described: 'A good description of the ToDo'
		             categorized: 'Production'
		             endingOn: '25/09/2022'
		             assignedTo: 'Agustin'.
		aToDoNote setCompletionStatusToFinished.
	self
		should: [ aToDoNote assignTo: 'Tomas' ]
		raise: ToDoNoteException
]
