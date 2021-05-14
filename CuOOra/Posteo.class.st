Class {
	#name : #Posteo,
	#superclass : #Object,
	#instVars : [
		'texto',
		'fechayhora',
		'usuario',
		'puntuacion'
	],
	#category : #'CuOOra-Models'
}

{ #category : #'as yet unclassified' }
Posteo >> eliminarPuntuacionDe: unUsuario [
	puntuacion removeAllSuchThat: [ :each | each usuario = unUsuario ]
]

{ #category : #accessing }
Posteo >> fechayhora [ 
	^ fechayhora 
]

{ #category : #initialization }
Posteo >> initialize [
	fechayhora := DateAndTime now.
	puntuacion := OrderedCollection new.
]

{ #category : #accessing }
Posteo >> puntuacion [ 
	^puntuacion
]

{ #category : #accessing }
Posteo >> puntuacionTotal [
	| tot |
	tot := 0.
	puntuacion
		ifNotEmpty: [ tot := puntuacion sum: [ :each | each puntuacion ifTrue: 1 ifFalse: -1] ].
	^ tot
]

{ #category : #abstract }
Posteo >> registrarPuntuacion: unUsuario valor: unValor [
	self eliminarPuntuacionDe: unUsuario.
	puntuacion add: (Puntuacion usuario: unUsuario valor: unValor)
]

{ #category : #accessing }
Posteo >> texto [
	^texto
]

{ #category : #accessing }
Posteo >> texto: anObject [
	texto := anObject
]

{ #category : #accessing }
Posteo >> usuario [
	^usuario
]

{ #category : #accessing }
Posteo >> usuario: unUsuario [
	usuario:= unUsuario
]
