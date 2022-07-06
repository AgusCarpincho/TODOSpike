"
ToDoNote reify the concept of PostIt notes or something similar with the meaning to serve the user with the cotidiane labors
"
Class {
	#name : #ToDo,
	#superclass : #Object,
	#instVars : [
		'description',
		'completionStatus',
		'identifier',
		'optionalCategory',
		'optionalCompletionDate',
		'optionalEmployeeName'
	],
	#category : #'TODOSpike-Model'
}

{ #category : #'instance creation' }
ToDo class >> identifiedByANumericalIdentifier: aNumericalIdentifier described: aDescription categorized: anOptionalCategory endingOn: anOptionalCompletionDate assignedTo: anOptionalNameEmployee [

	anOptionalNameEmployee withContentDo: [ :employee | 
		AssertionChecker
			enforce: employee isNotNil
			because: 'The employee name argument cannot be nil or empty'
			raising: ToDoInvalidArgument ].

	AssertionChecker
		enforce: aDescription isNotEmpty
		because: 'The description cannot be a empty string'
		raising: ToDoInvalidArgument.

	^ self new
		  initializeIdentifiedBy: aNumericalIdentifier
		  described: aDescription
		  categorized: anOptionalCategory
		  endingOn: anOptionalCompletionDate
		  assignedTo: anOptionalNameEmployee
]

{ #category : #transitioning }
ToDo >> assignCompletionDate: aCompletionDate [

	completionStatus assignNewCompletionDate: aCompletionDate
]

{ #category : #transitioning }
ToDo >> assignTo: aNameEmployee [

	completionStatus assignTo: aNameEmployee
]

{ #category : #accessing }
ToDo >> category [

	^ optionalCategory
]

{ #category : #accessing }
ToDo >> completionDate [

	^ optionalCompletionDate
]

{ #category : #accessing }
ToDo >> description [

	^ description
]

{ #category : #accessing }
ToDo >> designatedEmployee [

	^ optionalEmployeeName
]

{ #category : #accessing }
ToDo >> identifier [

	^ identifier
]

{ #category : #'initialization - private' }
ToDo >> initializeIdentifiedBy: aNumericalIdentifier described: aDescription categorized: anOptionalCategory endingOn: anOptionalCompletionDate assignedTo: anOptionalEmployeeName [

	description := aDescription.
	optionalCategory := anOptionalCategory.
	optionalCompletionDate := anOptionalCompletionDate.
	completionStatus := OpenCompletionStatus references:
		                    self.
	identifier := aNumericalIdentifier.
	optionalEmployeeName := anOptionalEmployeeName
]

{ #category : #asserter }
ToDo >> isAssigned [
	
	^ (optionalEmployeeName equalsTo: (Optional unusedBecause: 'Unassigned Employee')) not
]

{ #category : #asserter }
ToDo >> isFinished [

	^ completionStatus isFinished
]

{ #category : #asserter }
ToDo >> isInProgress [
	
	^ completionStatus isInProgress
]

{ #category : #asserter }
ToDo >> isOpen [

	^ completionStatus isOpen
]

{ #category : #transitioning }
ToDo >> setCompletionStatusToFinished [

	completionStatus := FinishedCompletionStatus references:
		                    self
]

{ #category : #transitioning }
ToDo >> setCompletionStatusToInProgress [

	completionStatus := (InProgressCompletionStatus references: self)
]

{ #category : #transitioning }
ToDo >> setCompletionStatusToOpen [

	completionStatus := OpenCompletionStatus references:
		                    self
]

{ #category : #'private - state protocol' }
ToDo >> throughStateAssignNewCompletionDate: aCompletionDate [

	| updatedToDo |
	updatedToDo := self class
		               identifiedByANumericalIdentifier: identifier
		               described: description
		               categorized: optionalCategory
		               endingOn:
		               (Optional containing: aCompletionDate)
		               assignedTo: optionalEmployeeName.

	optionalCompletionDate := updatedToDo completionDate
]

{ #category : #'private - state protocol' }
ToDo >> throughStateAssignTo: aNameEmployee [

	| updatedToDo |
	updatedToDo := self class
		               identifiedByANumericalIdentifier: identifier
		               described: description
		               categorized: optionalCategory
		               endingOn: optionalCompletionDate
		               assignedTo: (Optional containing: aNameEmployee).
		
	optionalEmployeeName := updatedToDo designatedEmployee
]
