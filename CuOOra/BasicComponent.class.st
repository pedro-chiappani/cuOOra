Class {
	#name : #BasicComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'instance creation' }
BasicComponent class >> newWithParent: aParent [
	^ self new initializeWithParent: aParent
]

{ #category : #initialization }
BasicComponent >> initializeWithParent: aParent [
parent:=aParent
]

{ #category : #initialization }
BasicComponent >> parent [ ^parent
]

{ #category : #initialization }
BasicComponent >> renderContentOn: aCanvas [
	aCanvas horizontalRule.
	aCanvas
		table: [ aCanvas
				tableData: [ aCanvas heading
						level: 1;
						with: [ aCanvas text: 'CuOOra'.
							aCanvas space: 5.
							aCanvas anchor
								callback: [ self parent call: PrincipalComponent new ];
								with: [ aCanvas button: 'Home' ].
							aCanvas space.
							aCanvas anchor
								callback: [ self parent call: BuscadorDeTopicosComponent new ];
								with: [ aCanvas button: 'Buscar Topicos' ] ].
					aCanvas
						tableData: [ aCanvas space: 150.
							aCanvas text: 'Bienvenido ' , self session usuario nombre ].
					aCanvas
						tableData: [ aCanvas text: '|'.
							aCanvas anchor
								callback: [ self parent call: LoginCuOOraComponent new ];
								with: 'Cerrar Sesion' ] ] ].
	aCanvas horizontalRule
]
