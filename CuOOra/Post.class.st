Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'texto',
		'fechayhora',
		'usuario',
		'puntuacion'
	],
	#category : #'CuOOra-Models'
}

{ #category : #accessing }
Post class >> text: aString [
	^ self new
		text: aString;
		yourself
]

{ #category : #initialization }
Post >> initialize [
	timeStamp := DateAndTime now
]

{ #category : #accessing }
Post >> text [
	^ text
]

{ #category : #accessing }
Post >> text: anObject [
	text := anObject
]

{ #category : #accessing }
Post >> timeStamp [
	^ timeStamp
]
