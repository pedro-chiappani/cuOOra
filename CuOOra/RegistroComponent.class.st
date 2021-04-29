Class {
	#name : #RegistroComponent,
	#superclass : #AccesoComponent,
	#instVars : [
		'nombre'
	],
	#category : #'CuOOra-UI'
}

{ #category : #rendering }
RegistroComponent >> registerAndLogin [
	|unUsuario|.
	unUsuario= Usuario new.
	"agregar usuario al cuoora - self model addUser: unUsuario."
	self procederCon: unUsuario
]

{ #category : #rendering }
RegistroComponent >> renderButtonsOn: aCanvas [
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
RegistroComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerAndLogin ];
		with: 'Registrar'
]
