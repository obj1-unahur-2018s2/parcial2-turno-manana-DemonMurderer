import Socios.*
class Viajes {
	var idiomas = #{}
	var property diasDeActividad = 0
	var esfuerzo = false
	var broncearse = false
	method agregarIdiomas(idioma) {idiomas.add(idioma)}
	method idiomas() = idiomas
	method diasDeActividad() = diasDeActividad
	method implicaEsfuerzo() = esfuerzo
	method setEsfuerzo() {esfuerzo = true}
	method quitarEsfuerzo() {esfuerzo = false}
	method sirveParaBroncearse() = broncearse
	method setBroncearse() {broncearse = true}
	method quitarBroncearse() {broncearse = false}
	method esInteresante() = idiomas.size()>=2
}
class ViajeDePlaya inherits Viajes{
	var property metros = 0
	override method diasDeActividad() = metros/500  
	override method implicaEsfuerzo() = metros>=1200
	override method sirveParaBroncearse() = true
}
class ExcursionACiudad inherits Viajes{
	var property atracciones = 0
	override method diasDeActividad() = atracciones/2
	override method implicaEsfuerzo() = atracciones.between(5,8)
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() or atracciones == 5
}
class ExcursionACiudadTropical inherits ExcursionACiudad{
	override method diasDeActividad() = super()+1
	override method sirveParaBroncearse() = true
}
class SalidaDeTrekking inherits Viajes{
	var property kilometros = 0
	var property diasDeSol = 0
	override method implicaEsfuerzo() = kilometros>=80
	override method sirveParaBroncearse() = diasDeSol>=200 or diasDeSol.between(100, 200) and kilometros>=120
	override method esInteresante() = super() and diasDeSol>=140
}
class ClasesDeGym{
	method idiomas() = #{"español"}
	method implicaEsfuerzo() = true
	method diasDeActividad() = 1
	method sirveParaBroncearse() = false
}
class Libro{
	var property idioma = null
	var property paginas = 0
	var property autor = null 
}
class TallerLiterario {
	var idiomas = #{}
	var libros = #{}
	method agregarIdiomas(idioma) {idiomas.add(idioma)}
	method idiomas() = idiomas
	method diasDeActividad() = libros.size()+1
	method implicaEsfuerzo() = libros.any({libro=> libro.paginas()>=500}) or libros.all({libro=> libro.autor()})
	method sirveParaBroncearse() = false
	method esInteresante() = idiomas.size()>=2
}