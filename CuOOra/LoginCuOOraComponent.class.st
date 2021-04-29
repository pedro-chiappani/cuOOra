Class {
	#name : #LoginCuOOraComponent,
	#superclass : #AccesoComponent,
	#category : #'CuOOra-UI'
}

{ #category : #callback }
LoginCuOOraComponent >> login [ 
	(self model usuarioConNombre: nombre protegidoPor: contraseña)
		ifNotNil: [ :it | self procederCon: it ].
	nombre := nil.
	contraseña := nil
]

{ #category : #callback }
LoginCuOOraComponent >> registrarUsuarioNuevo [
	self call: RegistroComponent new
]

{ #category : #rendering }
LoginCuOOraComponent >> renderButtonsOn: aCanvas [
	self renderIniciarSesionButtonOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas paragraph: 'No tienes una cuenta, crea una!'.
	self renderRegistrarButtonOn: aCanvas
]

{ #category : #rendering }
LoginCuOOraComponent >> renderIniciarSesionButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Iniciar Sesion'
]

{ #category : #rendering }
LoginCuOOraComponent >> renderRegistrarButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registrarUsuarioNuevo ];
		with: 'Registrate, es gratis'
]
