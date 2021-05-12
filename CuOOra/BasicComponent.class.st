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
	aCanvas
		paragraph: [ aCanvas heading: 'CuOOra '.
			aCanvas break.
			aCanvas emphasis: 'Bienvenido ' , self session usuario nombre.
			aCanvas space.
			aCanvas anchor
				callback: [ self parent call: LoginCuOOraComponent new ];
				with: 'Cerrar Sesion' ]
]
