Class {
	#name : #Puntuacion,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'puntuacion'
	],
	#category : #'CuOOra-models'
}

{ #category : #creation }
Puntuacion class >> usuario: unUsuario [
	^self new 
		usuario: unUsuario;
		yourself
]

{ #category : #initialization }
Puntuacion >> initialize [
	super initialize.
	puntuacion:= 0.
]

{ #category : #'as yet unclassified' }
Puntuacion >> negativo [
	puntuacion := puntuacion - 1.
]

{ #category : #'as yet unclassified' }
Puntuacion >> positivo [
	puntuacion:= puntuacion + 1.
]

{ #category : #accessing }
Puntuacion >> puntuacion [
	^puntuacion
]

{ #category : #accessing }
Puntuacion >> reset [ 
	puntuacion := 0
]

{ #category : #accessing }
Puntuacion >> usuario [
	^usuario
]

{ #category : #accessing }
Puntuacion >> usuario: unUsuario [
	usuario := unUsuario
]
