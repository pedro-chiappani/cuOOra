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
	|punt|.
	punt := Puntuacion new.
	punt positivo. punt positivo.
	resp registrarPuntuacion: punt.
	
	self assert: resp puntuacionTotal equals: 2.
]
