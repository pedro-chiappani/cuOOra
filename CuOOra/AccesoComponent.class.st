Class {
	#name : #AccesoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'email',
		'contraseña'
	],
	#category : #'CuOOra-UI'
}

{ #category : #accesing }
AccesoComponent >> contraseña [ 
	^contraseña 
]

{ #category : #accesing }
AccesoComponent >> contraseña: anContraseña [
	contraseña:=anContraseña 
]

{ #category : #accesing }
AccesoComponent >> email [
	^ email
]

{ #category : #accesing }
AccesoComponent >> email: anObject [
	email := anObject
]

{ #category : #model }
AccesoComponent >> model [
	^ SimpleNet soleInstance
]

{ #category : #private }
AccesoComponent >> procederCon: aUser [
	self session user: aUser.
	self call: PrincipalComponent new
]

{ #category : #rendering }
AccesoComponent >> renderButtonsOn: aCanvas [
	self subclassResponsibility
]

{ #category : #rendering }
AccesoComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
				  self renderButtonsOn: aCanvas ]
]

{ #category : #rendering }
AccesoComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Usuario'.
	aCanvas paragraph: [ aCanvas textInput on: #email of: self ].
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas passwordInput on: #contraseña of: self ]
]
