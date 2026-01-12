Extension { #name : 'FamixCallGraph' }

{ #category : '*Famix-CallGraphs-PathFinder' }
FamixCallGraph >> findPathFrom: aNode to: anotherNode [

	^ (FamixCallGraphPathFinder newOn: self) findPathFrom: aNode to: anotherNode
]
