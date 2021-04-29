Class {
	#name : #Post,
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
Post class >> text: aString [
	^ self new
		text: aString;
		yourself
]

{ #category : #accessing }
Post >> fechayhora [ 
	^ fechayhora 
]

{ #category : #initialization }
Post >> initialize [
	fechayhora := DateAndTime now.
	puntuacion := OrderedCollection new.
]

{ #category : #accessing }
Post >> puntuacion [ 
	^puntuacion
]

{ #category : #abstract }
Post >> registrarPuntuacion: unUsuario valor: unValor [
	^self subclassResponsibility 
]

{ #category : #accessing }
Post >> texto [
	^texto
]

{ #category : #accessing }
Post >> texto: anObject [
	texto := anObject
]

{ #category : #accessing }
Post >> usuario [
	^usuario
]

{ #category : #accessing }
Post >> usuario: unUsuario [
	usuario:= unUsuario
]
