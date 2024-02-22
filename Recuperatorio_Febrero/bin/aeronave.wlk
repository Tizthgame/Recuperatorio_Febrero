import aeropuertos.*


class Aeronave{
	var property estado_aeronave 
	var property plan_de_vuelo = []
	var property posicion_aeronave = 0
	var property puede_aterrizar = false

			
	method asignar_plan_vuelo(){
		cargar_aeropuertos.lista_posiciones_aerop().forEach({n =>
			plan_de_vuelo.add(n)
		})
		return plan_de_vuelo}
		
	 //metodo para comprovar que si el aeropuerta en el que esta esta dentro de su lista de destino
  	method comprobar_esta_en_plan(){
  		cargar_aeropuertos.aeronaves_pista().forEach({n =>
  		if(posicion_aeronave == plan_de_vuelo.get(n)){
		 puede_aterrizar = true
		 console.println("El aeropuerto esta en la lista de destionos")}
  		})
	}

	method despegar(){
		crear_aeronaves.lista_aeronaves().forEach({ n => //obtiene todos los elementos de la lista y recorre los aeron
	 	if(n.get(1).estado_aeronave() == "En Pista"){
	 		estado_aeronave = "En Vuelo"
	 		cargar_aeropuertos.aeronaves_pista(-1)}
	 		})
	 }
	 
//existen 3 estados para la aeronave, en pista, en terminal, en vuelo
//FALTA RESTRICCION POR capacidad_operacion_maxima

	method aterrizar(){
		crear_aeronaves.lista_aeronaves().forEach({ n =>
			if(n.get(1).estado_aeronave() =="En Vuelo" and puede_aterrizar){
				cargar_aeropuertos.aeronaves_pista(+1)
				estado_aeronave = "En Pista"
				console.println("La aeronave a aterrizado")}
				else{
					console.println("La aeronave no puede aterrizar")
					}
			}
	)}
}

object crear_aeronaves{
	var property lista_aeronaves = []
	
	method cargar_aeronaves(cant_aeronaves){
		new Range(start = 1, end = cant_aeronaves).forEach({n =>
			const aeron = new Aeronave(posicion_aeronave = cargar_aeropuertos.lista_aeropuertos().anyOne(),// 0.randomUpTo(cargar_aeropuertos.cantidadAeropuertos())
				estado_aeronave = "En Terminal",
				plan_de_vuelo = plan_de_vuelo)
			lista_aeronaves.add(aeron)})
			return lista_aeronaves}
}