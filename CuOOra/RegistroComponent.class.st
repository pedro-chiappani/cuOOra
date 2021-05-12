Class {
	#name : #RegistroComponent,
	#superclass : #AccesoComponent,
	#category : #'CuOOra-UI'
}

{ #category : #rendering }
RegistroComponent >> registerAndLogin [
	| unUsuario |
	unUsuario := Usuario nombre: nombre contra: contraseña.
	self model crearUsuario: nombre pass: contraseña.
	self answer 
]

{ #category : #rendering }
RegistroComponent >> renderButtonsOn: aCanvas [
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
RegistroComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerAndLogin ];
		with: 'Registrar'.
		aCanvas submitButton
		callback: [ self answer ];
		with: 'Cancelar'
		
]
