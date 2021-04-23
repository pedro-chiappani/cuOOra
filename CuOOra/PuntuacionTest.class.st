Class {
	#name : #PuntuacionTest,
	#superclass : #TestCase,
	#instVars : [
		'punt'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
PuntuacionTest >> setUp [
	|usu|
	usu := Usuario nombre: 'Juan' contra: 'hola123'.
	punt := Puntuacion usuario: usu.

]

{ #category : #tests }
PuntuacionTest >> testNegativo [
	punt negativo.
	self assert: punt puntuacion equals: -1.
]

{ #category : #tests }
PuntuacionTest >> testPositivo [
	punt positivo.
	self assert: punt puntuacion equals: 1.
]

{ #category : #tests }
PuntuacionTest >> testReset [
	punt positivo.
	punt positivo.
	punt reset.
	self assert: punt puntuacion equals: 0.
]
