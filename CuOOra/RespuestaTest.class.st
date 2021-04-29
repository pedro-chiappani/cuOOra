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
	|usu usu2|.
	usu := Usuario nombre: 'Pepe' contra: 'abc123'.
	usu2 := Usuario nombre: 'Joaco' contra: 'abc123'.
	resp registrarPuntuacion: usu valor: 1.
	resp registrarPuntuacion: usu2 valor: 1.
	self assert: resp puntuacionTotal equals: 2.
	"El test esta mas completo en el test de pregunta testPuntuacionTotal ya que hacen lo mismo"
]
