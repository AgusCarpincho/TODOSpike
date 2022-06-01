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

{ #category : #'initialization - private' }
ToDoNote class >> identifiedBy: anIdentifier described: aDescription categorized: aCategory endingOn: aCompletionDate assignedTo: nameEmployee withStatus: completionStatus [

	AssertionChecker
		enforce: (aDescription isNil or: anIdentifier isNil) not
		because: 'Cannot be passed a nil object by argument'
		raising: ToDoNoteException.

	AssertionChecker
		enforce: (aDescription isString and: aCategory isString)
		because: 'Cannot be passed a non string object by argument'
		raising: ToDoNoteException.
	AssertionChecker
		enforce: (aDescription isEmpty) not
		because: 'The description cannot be a empty string'
		raising: ToDoNoteException.

	^ self new
		  initializeIdentifiedBy: anIdentifier
		  described: aDescription
		  categorized: aCategory
		  endingOn: aCompletionDate
		  assignedTo: nameEmployee
		  withStatus: completionStatus
]

{ #category : #transitioning }
ToDoNote >> assignCompletionDate: aCompletionDate [

	(aCompletionDate sameAs: '') ifTrue: [ 
		ToDoNoteException signal: 'Invalid completion date'. ^ self ].

	^ ToDoNote
		  identifiedBy: self identifier
		  described: self description
		  categorized: self category
		  endingOn: aCompletionDate
		  assignedTo: self designatedEmployee
		  withStatus: self completionStatus
]

{ #category : #transitioning }
ToDoNote >> assignedTo: aNameEmployee [

	((completionStatus sameAs: 'In Progress') or: (completionStatus sameAs: 'Finished')) ifTrue: [ ToDoNoteException signal: 'A ToDoNote cant be assigned to an employee if the completion status isnt Open' ]
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
ToDoNote >> completionStatus [
	
	^ completionStatus
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
ToDoNote >> initializeIdentifiedBy: aNumericalIdentifier described: aDescription categorized: aCategory endingOn: aCompletionDate assignedTo: aEmployeeName withStatus: aCompletionStatus [

	description := aDescription.
	category := aCategory.
	completionDate := aCompletionDate.
	completionStatus := aCompletionStatus.
	identifier := aNumericalIdentifier.
	employeeName := aEmployeeName
]

{ #category : #transitioning }
ToDoNote >> setCompletionDateTo: aCompletionDate [

	(completionStatus sameAs: 'Open') not ifTrue: [ ToDoNoteException signal: 'The completion date cant be modify if the completion status is In Progress or Finished'].

	^ ToDoNote
		  identifiedBy: self identifier
		  described: self description
		  categorized: self category
		  endingOn: aCompletionDate
		  assignedTo: self designatedEmployee
		  withStatus: self completionStatus
]

{ #category : #transitioning }
ToDoNote >> setCompletionStatusToFinished [

	^ ToDoNote
		  identifiedBy: self identifier
		  described: self description
		  categorized: self category
		  endingOn: self completionDate
		  assignedTo: self designatedEmployee
		  withStatus: 'Finished'
]

{ #category : #transitioning }
ToDoNote >> setCompletionStatusToInProgress [
	
	^ ToDoNote
		  identifiedBy: self identifier
		  described: self description
		  categorized: self category
		  endingOn: self completionDate
		  assignedTo: self designatedEmployee
		  withStatus: 'In Progress'
]

{ #category : #transitioning }
ToDoNote >> setCompletionStatusToOpen [

	^ ToDoNote
		  identifiedBy: self identifier
		  described: self description
		  categorized: self category
		  endingOn: self completionDate
		  assignedTo: self designatedEmployee
		  withStatus: 'Open'
]
