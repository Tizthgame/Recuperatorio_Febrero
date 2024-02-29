import aeropuertos.*


class Aeronave{
	var property estado_aeronave 
	var property plan_de_vuelo = []
	var property posicion_aeronave = 0
	var property puede_aterrizar 

method asignar_plan_vuelo(){
        var lista
        var paso
         new Range(start = 1, end= crear_aeronaves.lista_aeronaves()).forEach({n => 
        	paso = cargar_aeropuertos.cantidadAeropuertos().get(0)
        	plan_de_vuelo = paso
       
        if (posicion_aeronave > cargar_aeropuertos.cantidadAeropuertos().div(2).truncate(0)){
        	lista = cargar_aeropuertos.lista_aeropuertos().reverse()
                 plan_de_vuelo =lista.subList((cargar_aeropuertos.cantidadAeropuertos()- posicion_aeronave) +1)
            }
        else if(posicion_aeronave < cargar_aeropuertos.cantidadAeropuertos().div(2).truncate(0)){
        	lista = cargar_aeropuertos.cantidadAeropuertos()
        		 plan_de_vuelo =lista.subList(posicion_aeronave)
        } })
		//new Range(start = 1, end = crear_aeronaves.lista_aeronaves()).forEach({n =>})
        return  plan_de_vuelo}

	 //metodo para comprovar que si el aeropuerta en el que esta esta dentro de su lista de destino
  	method comprobar_esta_en_plan(){
  		cargar_aeropuertos.aeronaves_pista().forEach({n =>
  		if(posicion_aeronave == plan_de_vuelo.get(n)){
		 puede_aterrizar = true
		 console.println("El aeropuerto esta en la lista de destionos")}
  		})
	}
//obtiene todos los elementos de la lista y recorre los aeron
	method despegar(){
		crear_aeronaves.lista_aeronaves().forEach({ n => 
	 	if(n.get(1).estado_aeronave() == "En Pista"){
	 		estado_aeronave = "En Vuelo"
	 		cargar_aeropuertos.aeronaves_pista(-1)}
	 		})
	 }
	 
//existen 3 estados para la aeronave, en pista, en terminal, en vuelo
//FALTA RESTRICCION POR capacidad_operacion_maxima

	/*method aterrizar(){
		crear_aeronaves.lista_aeronaves().forEach({ n =>
			if(n.get(1).estado_aeronave() =="En Vuelo" and puede_aterrizar){
				cargar_aeropuertos.aeronaves_pista(+1)
				estado_aeronave = "En Pista"
				console.println("La aeronave a aterrizado")}
				else{
					console.println("La aeronave no puede aterrizar")
					}
			}
	)}*/
}

object crear_aeronaves{
	var property lista_aeronaves = []
	
	method cargar_aeronaves(cant_aeronaves){
		new Range(start = 1, end = cant_aeronaves).forEach({n =>
			const aeron = new Aeronave(
				posicion_aeronave = 0.randomUpTo(cargar_aeropuertos.cantidadAeropuertos()).truncate(0),
				estado_aeronave = "En Terminal",
				puede_aterrizar = false)
			lista_aeronaves.add(aeron)})
			return lista_aeronaves}
}