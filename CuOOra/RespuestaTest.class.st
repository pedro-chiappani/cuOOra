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
	"Si tiene un like y un dislike la publicacion tiene como puntuacion 0. testea tanto la puntuacion total como registrarPuntuacion"
	|usu usu2|.
	usu := Usuario new.
	usu2 := Usuario new.
	resp registrarPuntuacion: usu valor: 1.
	resp registrarPuntuacion: usu2 valor: 1.
	self assert: resp puntuacionTotal equals: 2.
]
