Class {
	#name : #Puntuacion,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'puntuacion'
	],
	#category : #'CuOOra-Models'
}

{ #category : #creation }
Puntuacion class >> usuario: unUsuario valor: unValor [
	^self new 
		usuario: unUsuario;
		puntuacion: unValor;
		yourself
]

{ #category : #initialization }
Puntuacion >> initialize [
	super initialize.
	puntuacion:= true.
]

{ #category : #accessing }
Puntuacion >> puntuacion [
	^puntuacion
]

{ #category : #accessing }
Puntuacion >> puntuacion: unValor [
	puntuacion:= unValor 
]

{ #category : #accessing }
Puntuacion >> usuario [
	^usuario
]

{ #category : #accessing }
Puntuacion >> usuario: unUsuario [
	usuario := unUsuario
]
