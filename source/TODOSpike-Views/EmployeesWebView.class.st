Class {
	#name : #EmployeesWebView,
	#superclass : #WAPainter,
	#instVars : [
		'employees'
	],
	#category : #'TODOSpike-Views'
}

{ #category : #'private - creating' }
EmployeesWebView >> createColumnOfEmployees [

	^ ContainerWebView
		  wrapping: [ :canvas | 
			  canvas render: (self createHeadingWebViewLabeled: 'Employees').
			  self session applicationContext repositorySystem employeeNames do: [ 
				  :anEmployee | 
				  canvas render:
					  (self createEmployeeItemViewWithEmployee: anEmployee) ] ]
		  intoElementBuiltUsing: [ :canvas | canvas div ]
		  applying: [ :theContainer | 
			  theContainer addClass willow.
			  theContainer setStyleTo: [ :style | 
				  style
					  backgroundColor: '#	F3F3F3';
					  boxShadow:
						  '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
					  color: '#EE8625';
					  borderRadius: 10 px;
					  padding: 20 px;
					  height: 500 px;
					  display: 'table';
					  fontSize: 20 px;
					  width: 430 px;
					  margin: 20 px ] ]
]

{ #category : #'private - creating' }
EmployeesWebView >> createEmployeeItemViewWithEmployee: aNameEmployee [

	^ ContainerWebView
		  wrapping: [ :canvas | canvas render: aNameEmployee ]
		  intoElementBuiltUsing: [ :canvas | canvas div ]
		  applying: [ :theContainer | 
			  theContainer addClass willow.
			  theContainer setStyleTo: [ :style | 
				  style
					  backgroundColor: '#	F3F3F3';
					  boxShadow:
						  '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
					  color: '#black';
					  borderRadius: 10 px;
					  padding: 10 px;
					  display: 'inline-block';
					  height: 60 px;
					  fontSize: 20 px;
					  width: 370 px;
					  margin: 5 px ] ]
]

{ #category : #'private - creating' }
EmployeesWebView >> createHeadingWebViewLabeled: aLabel [

	^ HeadingWebView
		  displaying: aLabel
		  withLevel: 2
		  applying: [ :canvas | 
			  canvas setStyleTo: [ :style | 
				  style
					  color: #black;
					  fontFamily: #Roboto;
					  margin: 20 px;
					  marginTop: 30 px ] ]
]

{ #category : #initialization }
EmployeesWebView >> initialize [

	employees := self createColumnOfEmployees
]

{ #category : #rendering }
EmployeesWebView >> renderContentOn: aRenderer [

	aRenderer render: employees
]
