Class {
	#name : #UsuarioComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
UsuarioComponent >> renderContentOn: aCanvas [
	aCanvas paragraph with: 'hola que tal'.
	aCanvas paragraph with: 'mariano'.
]
