import Viajes.*
class Socios {
	var actividades = []
	var property edad = 0
	var idiomas = #{}
	var property maxActividad = 0
	method esAdoradorDelSol() = actividades.all({actividad => actividad.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividades.filter({actividad=> actividad.implicaEsfuerzo()})
	method registrarActividad(actividad) {if (actividades.size()>=maxActividad){
		assert.error("No se pueden agregar mas Actividades")
	} else {actividades.add(actividad)}}
	method leAtrae(actividad)
	method agregarIdiomas(idioma) {idiomas.add(idioma)}
	method actividadRecomendada(actividad) = actividad.esInteresante() and self.leAtrae(actividad) and not actividades.contains(actividad) or edad.between(20, 30)
}
class SocioTranquilo inherits Socios{
	override method leAtrae(actividad) = actividad.diasDeActividad()>=4 
}
class SocioCoherente inherits Socios{
	override method leAtrae(actividad) = self.esAdoradorDelSol() and actividad.sirveParaBroncearse() or actividad.implicaEsfuerzo()
}
class SocioRelajado inherits Socios{
	override method leAtrae(actividad) = actividad.idiomas().intersection(idiomas).size()>1
}