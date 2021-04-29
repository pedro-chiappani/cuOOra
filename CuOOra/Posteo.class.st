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
	^self subclassResponsibility 
]

{ #category : #abstract }
Posteo >> registrarPuntuacion: unUsuario valor: unValor [
	^self subclassResponsibility 
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
