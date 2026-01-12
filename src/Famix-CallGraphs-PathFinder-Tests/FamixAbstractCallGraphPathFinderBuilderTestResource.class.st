Class {
	#name : 'FamixAbstractCallGraphPathFinderBuilderTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'graph',
		'javaModel'
	],
	#category : 'Famix-CallGraphs-PathFinder-Tests-Resources',
	#package : 'Famix-CallGraphs-PathFinder-Tests',
	#tag : 'Resources'
}

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource class >> javaSourcesFolder [
	"Return the java folder containing the sources to parse for those tests"

	| folder |
	folder := FamixCallGraphPathFinderBridge sources / ((self name withoutPrefix: 'FamixJavaCallGraphPathFinder') withoutSuffix: 'Resource') uncapitalized.

	folder ifAbsent: [ self error: 'Folder does not exists ' , folder pathString ].

	^ folder
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource class >> sourcesFolder [
	"Return the java folder containing the sources to parse for those tests"

	| folder |
	folder := self sourcesFolder / 'src'.

	folder ifAbsent: [ self error: 'Folder does not exists ' , folder pathString ].

	^ folder
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> entryPoints [

	^ javaModel allMethods select: [ :method | method name = 'main' ]
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> generateGraph [

	graph := (FamixJavaCHABuilder entryPoints: self entryPoints) build
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> graph [
	^ graph
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> importModels [

	javaModel := (FamixJavaFoldersImporter importFolders: { self javaSourcesFolder }) anyOne.
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> javaModel [

	^ javaModel
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> javaSourcesFolder [

	^ self class javaSourcesFolder
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> setUp [

	super setUp.
	self importModels.
	self generateGraph
]

{ #category : 'accessing' }
FamixAbstractCallGraphPathFinderBuilderTestResource >> tearDown [

	javaModel := nil.
	graph := nil.
	super tearDown
]
