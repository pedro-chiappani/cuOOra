Class {
	#name : #AccesoComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
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

{ #category : #model }
AccesoComponent >> model [
	^ CuOOra soleInstance
]

{ #category : #accesing }
AccesoComponent >> nombre [
	^ nombre
]

{ #category : #accesing }
AccesoComponent >> nombre: anObject [
	nombre := anObject
]

{ #category : #private }
AccesoComponent >> procederCon: aUser [
	self session .
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
	aCanvas paragraph: [ aCanvas textInput on: #nombre of: self ].
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas passwordInput on: #contraseña of: self ]
]
