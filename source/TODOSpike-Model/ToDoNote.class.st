"
ToDoNote reify the concept of PostIt notes or something similar with the meaning to serve the user with the cotidiane labors
"
Class {
	#name : #ToDoNote,
	#superclass : #Object,
	#instVars : [
		'description',
		'category',
		'completionStatus',
		'employeeName',
		'completionDate',
		'identifier'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDoNote class >> identifiedBy: anIdentifier described: aDescription categorized: aCategory endingOn: aCompletionDate assignedTo: nameEmployee [

	AssertionChecker
		enforce: aDescription isNotEmpty
		because: 'The description cannot be a empty string'
		raising: ToDoNoteException.

	^ self new
		  initializeIdentifiedBy: anIdentifier
		  described: aDescription
		  categorized: aCategory
		  endingOn: aCompletionDate
		  assignedTo: nameEmployee
]

{ #category : #transitioning }
ToDoNote >> assignCompletionDate: aCompletionDate [

	completionStatus assignNewCompletionDate: aCompletionDate
]

{ #category : #transitioning }
ToDoNote >> assignTo: aNameEmployee [

	completionStatus assignTo: aNameEmployee
]

{ #category : #accessing }
ToDoNote >> category [
	^ category
]

{ #category : #accessing }
ToDoNote >> completionDate [

	^ completionDate
]

{ #category : #accessing }
ToDoNote >> description [
	^ description
]

{ #category : #accessing }
ToDoNote >> designatedEmployee [
	
	^ employeeName
]

{ #category : #accessing }
ToDoNote >> identifier [

	^ identifier
]

{ #category : #'initialization - private' }
ToDoNote >> initializeIdentifiedBy: aNumericalIdentifier described: aDescription categorized: aCategory endingOn: aCompletionDate assignedTo: aEmployeeName [

	description := aDescription.
	category := aCategory.
	completionDate := aCompletionDate.
	completionStatus := ToDoNoteOpenCompletionStatus isStateOf: self.
	identifier := aNumericalIdentifier.
	employeeName := aEmployeeName
]

{ #category : #testing }
ToDoNote >> isFinished [

	^ completionStatus isFinished
]

{ #category : #testing }
ToDoNote >> isInProgress [

	^ completionStatus isInProgress
]

{ #category : #testing }
ToDoNote >> isOpen [

	^ completionStatus isOpen
]

{ #category : #transitioning }
ToDoNote >> setCompletionStatusToFinished [

	completionStatus := ToDoNoteFinishedCompletionStatus isStateOf:
		                    self
]

{ #category : #transitioning }
ToDoNote >> setCompletionStatusToInProgress [

	completionStatus := (ToDoNoteInProgressCompletionStatus isStateOf: self)
]

{ #category : #transitioning }
ToDoNote >> setCompletionStatusToOpen [

	completionStatus := ToDoNoteOpenCompletionStatus isStateOf:
		                    self
]

{ #category : #'private - state protocol' }
ToDoNote >> throughStateAssignNewCompletionDate: aCompletionDate [

	| updatedToDo |
	updatedToDo := ToDoNote
		               identifiedBy: identifier
		               described: description
		               categorized: category
		               endingOn: aCompletionDate
		               assignedTo: employeeName.

	completionDate := updatedToDo completionDate
]

{ #category : #'private - state protocol' }
ToDoNote >> throughStateAssignTo: aNameEmployee [

	| updatedToDo |
	updatedToDo := ToDoNote
		               identifiedBy: identifier
		               described: description
		               categorized: category
		               endingOn: completionDate
		               assignedTo: aNameEmployee.
		
	employeeName := updatedToDo designatedEmployee
]
