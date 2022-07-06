"
Baseline of TODOSpike
"
Class {
	#name : #BaselineOfTODOSpike,
	#superclass : #BaselineOf,
	#category : #BaselineOfTODOSpike
}

{ #category : #baselines }
BaselineOfTODOSpike >> baseline: spec [
	<baseline>
		spec
			for: #pharo
			do: [ self
					setUpDependenciesIn: spec;
					setUpPackagesIn: spec;
					setUpGroupsIn: spec
				]
]

{ #category : #accessing }
BaselineOfTODOSpike >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #initialization }
BaselineOfTODOSpike >> setUpDependenciesIn: spec [

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6/source' ];
		baseline: 'WillowBootstrap' with: [ spec repository: 'github://ba-st/Willow-Bootstrap:v13/source' ];
		baseline: 'WillowSpinKit' with: [ spec repository: 'github://ba-st/Willow-SpinKit:v9/source' ]
]

{ #category : #initialization }
BaselineOfTODOSpike >> setUpGroupsIn: spec [

	spec
		group: 'Deployment'
		with:
			#( 'TODOSpike-Model' 'TODOSpike-Application'
			   'TODOSpike-Views' 'TODOSpike-System-Model');
		group: 'Tests' with: #( 'TODOSpike-Tests' );
		group: 'CI' with: 'Tests';
		group: 'Tools' with: #(  );
		group: 'Dependent-SUnit-Extensions' with: #(  );
		group: 'Development' with: #( 'Tools' 'Tests' )
]

{ #category : #initialization }
BaselineOfTODOSpike >> setUpPackagesIn: spec [

	spec
		package: 'TODOSpike-Model' with: [ spec requires: #( 'Buoy' ) ];
		package: 'TODOSpike-Tests'
		with: [ 
			spec requires: 'TODOSpike-Model'];
		package: 'TODOSpike-Application'
		with: [ spec requires: #( 'TODOSpike-System-Model' ) ];
		package: 'TODOSpike-System-Model'
		with: [ spec requires: #( 'TODOSpike-Model' ) ];
		package: 'TODOSpike-Views'
		with: [ spec requires: #( 'TODOSpike-Application' ) ]
]
