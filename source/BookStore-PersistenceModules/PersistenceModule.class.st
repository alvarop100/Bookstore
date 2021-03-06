"
.
"
Class {
	#name : #PersistenceModule,
	#superclass : #SystemModule,
	#instVars : [
		'rootSystem'
	],
	#category : #'BookStore-PersistenceModules'
}

{ #category : #'Instance Creation' }
PersistenceModule class >> toInstallOn: aRootSystem [

   ^self new initializeToInstallOn: aRootSystem
]

{ #category : #accessing }
PersistenceModule >> configurations [
	"La idea es poder ofrecer mas de uno por modulo, pero mejor seria desglozar primero ese configuration. -apiorno"

	^ Array
		with:
			(PersistenceConfiguration
				for: self describedClass 
				using: self persistenceSystem 
				creatingClassModelWith: self creationModelBlock
				creatingDescriptorModelWith: self creationDescriptorBlock
				creatingTableNamed: self tableName
				with: self creationTableBlock)
]

{ #category : #accessing }
PersistenceModule >> creationDescriptorBlock [

	self subclassResponsibility
]

{ #category : #accessing }
PersistenceModule >> creationModelBlock [

	self subclassResponsibility
]

{ #category : #accessing }
PersistenceModule >> creationTableBlock [

	self subclassResponsibility
]

{ #category : #accessing }
PersistenceModule >> describedClass [

	self subclassResponsibility
]

{ #category : #accessing }
PersistenceModule >> initializeToInstallOn: aRootSystem [
	rootSystem := aRootSystem.
	self registerPersistence
]

{ #category : #accessing }
PersistenceModule >> name [

	self subclassResponsibility
]

{ #category : #accessing }
PersistenceModule >> persistenceSystem [
	
	^rootSystem systemImplementing: #PersistenceSystemInterface
]

{ #category : #accessing }
PersistenceModule >> registerPersistence [

	self subclassResponsibility
]

{ #category : #accessing }
PersistenceModule >> rootSystem [

	^ rootSystem
]

{ #category : #private }
PersistenceModule >> systemInterfacesToInstall [
	^ #()
]

{ #category : #accessing }
PersistenceModule >> tableName [

	self subclassResponsibility
]
