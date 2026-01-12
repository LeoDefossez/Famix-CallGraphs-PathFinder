Class {
	#name : 'BaselineOfFamixCallGraphsPathFinder',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixCallGraphsPathFinder',
	#package : 'BaselineOfFamixCallGraphsPathFinder'
}

{ #category : 'baselines' }
BaselineOfFamixCallGraphsPathFinder >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
			"Dependencies"
			self gitBridge: spec.
			self famixCallGraphs: spec.
			

			"Packages"
			spec
				package: 'Famix-CallGraphs-PathFinder';
				package: 'Famix-CallGraphs-PathFinder-Tests' with: [ spec requires: #( 'Famix-CallGraphs-PathFinder' ) ].

			"Groups"
			spec
				group: 'Core' with: #( 'Famix-CallGraphs-PathFinder' );
				group: 'Tests' with: #( 'Famix-CallGraphs-PathFinder-Tests' ) ]
]

{ #category : 'baselines' }
BaselineOfFamixCallGraphsPathFinder >> famixCallGraphs: spec [

	spec baseline: 'FamixCallGraphs' with: [ spec repository: 'github://jecisc/Famix-CallGraphs/src' ]
]

{ #category : 'baselines' }
BaselineOfFamixCallGraphsPathFinder >> gitBridge: spec [

	self flag: #todo. "Already a dependency of FamixCallGraphs, should not need to import this"

	spec baseline: 'GitBridge' with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ]
]
