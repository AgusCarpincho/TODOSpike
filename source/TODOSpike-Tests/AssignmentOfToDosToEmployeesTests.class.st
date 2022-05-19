Class {
	#name : #AssignmentOfToDosToEmployeesTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
AssignmentOfToDosToEmployeesTests >> test01AToDoNoteCanBeAssignedToAnEmployee [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'A good description of the ToDo' categorized: 'Production' and: '25/09/2022'.
	aToDoNote assignedTo: 'Agustin'.
	self assert: aToDoNote designatedEmployee equals: 'Agustin'
]

{ #category : #tests }
AssignmentOfToDosToEmployeesTests >> test02AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsInProgress [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'A good description of the ToDo' categorized: 'Production' and: '25/09/2022'.
	aToDoNote assignedTo: 'Agustin'.
	aToDoNote setCompletionStatusToInProgress .
	self should: [ aToDoNote assignedTo: 'Tomas' ] raise: ToDoNoteFailure .
]

{ #category : #tests }
AssignmentOfToDosToEmployeesTests >> test03AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsFinished [

	| aToDoNote |
	
	aToDoNote := ToDoNote enumerated: 1 with: 'A good description of the ToDo' categorized: 'Production' and: '25/09/2022'.
	aToDoNote assignedTo: 'Agustin'.
	aToDoNote setCompletionStatusToFinished .
	self should: [ aToDoNote assignedTo: 'Tomas' ] raise: ToDoNoteFailure .
]
