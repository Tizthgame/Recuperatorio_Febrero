import aeronave.*

//Cada aeropuerto tiene dos areas, el área de terminal y el área de pista.
class Aeropuerto {
    var codigo 
    var property aeronaves_en_terminal
    var property aeronaves_en_pista
    var property posicion_aeropuerto 

    }

object cargar_aeropuertos{
	var property lista_posiciones_aerop = []
    var property lista_aeropuertos = []
	const capacidad_operacion_maxima = 10
	var property aeronaves_pista = []

    method crear_aeropuertos(cant_aeropuertos){
            new Range(start = 1, end = cant_aeropuertos).forEach({n =>
                const aerop = new Aeropuerto(
                posicion_aeropuerto = n * 10,
                codigo = "HF" + n, aeronaves_en_terminal = 0.randomUpTo(30).truncate(0),
                aeronaves_en_pista = 0.randomUpTo(capacidad_operacion_maxima).truncate(0))
                lista_posiciones_aerop.add(aerop.posicion_aeropuerto())
                aeronaves_pista.add(aerop.aeronaves_en_pista())
                lista_aeropuertos.add(aerop)
                })

            return lista_aeropuertos
        }
}