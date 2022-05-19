Class {
	#name : #AssignmentOfToDosToEmployeesTests,
	#superclass : #TestCase,
	#category : #'TODOSpike-Tests'
}

{ #category : #tests }
AssignmentOfToDosToEmployeesTests >> test01AToDoNoteCanBeAssignedToAnEmployee [

	| aToDoNote |
	
	aToDoNote := ToDoNote with: 'A good description of the ToDo' categorized: 'Production' endingDate: '25/09/2022'.
	aToDoNote assignedTo: 'Agustin'.
	self assert: aToDoNote designatedEmployee equals: 'Agustin'
]

{ #category : #tests }
AssignmentOfToDosToEmployeesTests >> test02AToDoNoteCantBeAssignedToAnEmployeWhenTheToDoIsInProgress [

	| aToDoNote |
	
	aToDoNote := ToDoNote with: 'A good description of the ToDo' categorized: 'Production' endingDate: '25/09/2022'.
	aToDoNote assignedTo: 'Agustin'.
	aToDoNote setCompletionStatusToInProgress .
	self should: [ aToDoNote assignedTo: 'Tomas' ] raise: ToDoNoteFailure .
]
