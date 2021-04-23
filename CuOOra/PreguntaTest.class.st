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
	|user|.
	user:= Usuario new .
	preg := Pregunta titulo: 'Hola' descripcion: 'Es un saludo'  usuario: user .
	
	
	
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
	|punt|.
	punt:= Puntuacion new.
	punt positivo.
	preg registrarPuntuacion: punt.
	preg registrarPuntuacion: punt.
	self assert: preg puntuacionTotal equals: 2.
]
