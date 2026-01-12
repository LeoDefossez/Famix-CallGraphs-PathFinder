# Famix-CallGraph-PathFinder

**Helps user to find one or multiple paths between to node of a callgraph**  
External dependencies :
- [Famix-CallGraphs](https://github.com/jecisc/Famix-CallGraphs) : Offer the implementation of call graphs.   
- [GitBridge](https://github.com/jecisc/GitBridge) : Offer a simple API to simplify tests  


## Installation

Install the project in your Moose image via Metacello:

```smalltalk
Metacello new
    baseline: 'FamixCallGraphsPathFinder';
    githubUser: 'LeoDefossez' project: 'Famix-CallGraphs-PathFinder' commitish: 'master' path: 'src';
    load
```

## Workflow & Usage

### 1. Initialize your finder on a graph
```smalltalk
FamixCallGraphPathFinder newOn: aGraph
```

### 2. Choose one of the following method to find path between two nodes of the graph
```smalltalk
"try finding a path between two node"
finder findPathFrom: startNode to: targetNode.

"Search for all paths between two node (with a colloration algorithm)"
finder findAllPathFrom: startNode to: targetNode.

"Search for a path between two node given the full qualified name of their method"
finder findPathFromNodeNamed: startNodeName toNodeNamed: targetNodeName.

"Search for all paths between two node given the full qualified name of their method"
finder findAllPathFromNodeNamed: startNodeName toNodeNamed: targetNodeName
``` 


## Documentation

* [User Documentation](resources/documentation/UserDocumentation.md)
