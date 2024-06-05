import semillas.*

class Parcela {
	var ancho
	var largo
	var horasDeSolQueRecibe
	const plantas = []
	
	method ancho() = ancho
	method largo() = largo
	method horasDeSolQueRecibe() = horasDeSolQueRecibe
	method plantas() = plantas
	method plantar(unaPlanta){
		if(plantas.size() < self.capacidadMaximaDePlantasQueTolera() and self.horasDeSolQueRecibe() <= unaPlanta.horasDeSolQueTolera()) 
			plantas.add(unaPlanta)
	}
	method superficie() = ancho * largo
	method anchoMayorQueLargo() = ancho > largo
	method capacidadMaximaDePlantasQueTolera() = if(self.anchoMayorQueLargo()) self.superficie() / 5 else self.superficie() / 3 + largo
	method tieneComplicaciones() = plantas.any({planta => planta.horasDeSolQueTolera() < self.horasDeSolQueRecibe()})
	method cantidadDePlantas() = plantas.size()
}

class ParcelaEcologica inherits Parcela{
	method seAsociaBien(unaPlanta) = ! self.tieneComplicaciones() and unaPlanta.esParcelaIdeal(self)
	method cantidadDePlantasAsociadas() = plantas.count({planta => planta.seAsociaBien(planta)})
}

class ParcelaIndustrial inherits Parcela{
	method seAsociaBien(unaPlanta) = self.capacidadMaximaDePlantasQueTolera() <= 2 and unaPlanta.esFuerte()
	method cantidadDePlantasAsociadas() = plantas.count({planta => planta.seAsociaBien(planta)})
}