Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'preg'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	|user topicos aux|.
	user:= Usuario new .
	topicos := OrderedCollection new.
	aux := Topico new. topicos add: aux. topicos add: aux.
	preg := Pregunta titulo: 'Hola' descripcion: 'Es un saludo'  usuario: user topicos: topicos.
	
	
	
]

{ #category : #tests }
PreguntaTest >> testEliminarResp [
	|resp |.
	resp:= Respuesta new.
	preg respuestas: resp.
	self assert: preg respuestas size equals: 1.
	preg eliminarRespuestas.
	self assert: preg respuestas size equals: 0.	 
]

{ #category : #tests }
PreguntaTest >> testPuntuacionTotal [
	"Si tiene un like y un dislike la publicacion tiene como puntuacion 0"
	|usu usu2|.
	usu := Usuario nombre: 'Juan' contra: '213'.
	usu2 := Usuario nombre: 'Mariano' contra: '123'.
	preg registrarPuntuacion: usu valor: 1.
	preg registrarPuntuacion: usu2 valor: 1.
	self assert: preg puntuacionTotal equals: 2.
	
	preg registrarPuntuacion: usu valor:-1.
	self assert: preg puntuacionTotal equals: 0.
	
	preg registrarPuntuacion: usu valor:1.
	self assert: preg puntuacionTotal equals: 2.
	
	
]
