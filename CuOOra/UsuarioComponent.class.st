Class {
	#name : #UsuarioComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-UI'
}

{ #category : #rendering }
UsuarioComponent >> renderContentOn: aCanvas [
	aCanvas paragraph with: 'hola que tal'.
	aCanvas paragraph with: 'mariano'.
]
