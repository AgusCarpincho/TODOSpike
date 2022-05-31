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
		             assignedTo: 'Agustin'
		             withStatus: 'Open'.
		
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
		             assignedTo: 'Tomas'
		             withStatus: 'In Progress'.
	self
		should: [ aToDoNote assignedTo: 'Tomas' ]
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
		             assignedTo: 'Agustin'
		             withStatus: 'Finished'.
	self
		should: [ aToDoNote assignedTo: 'Tomas' ]
		raise: ToDoNoteException
]
