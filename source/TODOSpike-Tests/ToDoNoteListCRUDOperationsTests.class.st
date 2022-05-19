Class {
	#name : #ToDoNoteListCRUDOperationsTests,
	#superclass : #TestCase,
	#instVars : [
		'aToDoNoteList',
		'aToDoNoteListWithASingleToDo'
	],
	#category : #'TODOSpike-Tests'
}

{ #category : #running }
ToDoNoteListCRUDOperationsTests >> setUp [
	super setUp.
	aToDoNoteList := ToDoNoteList named: 'Development ToDos'.
	aToDoNoteListWithASingleToDo := ToDoNoteList named: 'Development ToDos'.
	aToDoNoteListWithASingleToDo add: (ToDoNote enumerated: 1 with: 'A good description').
	"Put here a common initialization logic for tests"
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test01ANewToDoNoteListStartsWithoutToDoNotes [

	self assert: aToDoNoteList numberOfToDos equals: 0.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test02AToDoNoteListCanAddANewToDoNoteAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList add: (ToDoNote enumerated: 1 with: 'A good description' categorized: 'Reify ToDoNoteList' and: '25/9/2022').
	self assert: aToDoNoteList numberOfToDos equals: 1.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test03AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList add: (ToDoNote enumerated: 1 with: 'A good description' categorized: 'Reify ToDoNoteList').
	self assert: aToDoNoteList numberOfToDos equals: 1.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test04AToDoNoteListCanAddANewToDoNoteWithoutCompletionDateAndCategoryAndTheNumberOfTodosIsOneInTheToDoNoteList [

	aToDoNoteList add: (ToDoNote enumerated: 1 with: 'A good description').
	self assert: aToDoNoteList numberOfToDos equals: 1.
]

{ #category : #tests }
ToDoNoteListCRUDOperationsTests >> test05AToDoNoteCanBeDeletedFromTheToDoNoteListIfItsCompletionStatusIsOpen [

	aToDoNoteListWithASingleToDo deleteToDoWithNumber: 1.
	self assert: aToDoNoteList numberOfToDos equals: 0.
]
