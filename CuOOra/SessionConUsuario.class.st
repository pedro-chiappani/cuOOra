Class {
	#name : #SessionConUsuario,
	#superclass : #WASession,
	#instVars : [
		'usuario'
	],
	#category : #'CuOOra-UI'
}

{ #category : #accessing }
SessionConUsuario >> usuario [
	^usuario
]

{ #category : #accessing }
SessionConUsuario >> usuario: anUser [
	usuario:= anUser
]
