Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'resp'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
RespuestaTest >> setUp [
	resp := Respuesta new.

]

{ #category : #tests }
RespuestaTest >> testPuntuacionTotal [ 
		"Si tiene un like y un dislike la publicacion tiene como puntuacion 0"
	|usu usu2|.
	usu := Usuario nombre: 'Juan' contra: '213'.
	usu2 := Usuario nombre: 'Mariano' contra: '123'.
	resp registrarPuntuacion: usu valor: true.
	resp registrarPuntuacion: usu valor: true.
	resp registrarPuntuacion: usu2 valor: true.
	self assert: resp puntuacionTotal equals: 2.
	
	resp registrarPuntuacion: usu valor: false.
	self assert: resp puntuacionTotal equals: 0.
	
	resp registrarPuntuacion: usu valor: true.
	self assert: resp puntuacionTotal equals: 2.
]
