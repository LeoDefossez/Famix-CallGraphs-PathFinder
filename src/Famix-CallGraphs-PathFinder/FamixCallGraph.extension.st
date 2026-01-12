Extension { #name : 'FamixCallGraph' }

{ #category : '*Famix-CallGraphs-PathFinder' }
FamixCallGraph >> findPathFrom: aNode to: anotherNode [

	^ (FamixCallGraphPathFinder newOn: self) findPathFrom: aNode to: anotherNode
]

{ #category : '*Famix-CallGraphs-PathFinder' }
FamixCallGraph >> nodeNamed: aString [

	self allNodes
		detect: [ :node | node realMethod mooseName = aString ]
		ifFound: [ :node | ^ node ]
		ifNone: [ self error: 'No node named ' , aString , ' in the graph' ]
]
