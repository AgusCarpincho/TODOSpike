Class {
	#name : #TODOSpikeSession,
	#superclass : #WillowSession,
	#instVars : [
		'applicationContext'
	],
	#category : #'TODOSpike-Application'
}

{ #category : #accessing }
TODOSpikeSession >> applicationContext [

	^ applicationContext
]

{ #category : #accessing }
TODOSpikeSession >> startUpApplicationContextFor: aWillowApplication [

	super startUpApplicationContextFor: aWillowApplication.
	applicationContext := TODOSpikeApplicationContext new
]
