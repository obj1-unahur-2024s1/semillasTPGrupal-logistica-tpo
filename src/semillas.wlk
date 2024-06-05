import parcelas.*

class Planta {
	var anioDeObtencionDeSemilla
	var altura 
	
	method anioDeObtencionDeSemilla() = anioDeObtencionDeSemilla
	method altura() = altura
	method horasDeSolQueTolera() 
	method esFuerte() = self.horasDeSolQueTolera() > 10
	method daNuevasSemillas() = self.esFuerte() or self.segundaCondicion()
	method segundaCondicion() 
	method espacioOcupado() 
}

class Menta inherits Planta{
	override method horasDeSolQueTolera() = 6
	override method segundaCondicion() = self.altura() > 0.4
	override method espacioOcupado() = self.altura() * 3
	method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Planta {
	override method horasDeSolQueTolera() = if(self.altura() < 0.5) 6 else if(self.altura().between(0.5, 1)) 7 else 9
	override method segundaCondicion() = self.anioDeObtencionDeSemilla() > 2007 and self.altura() > 1
	override method espacioOcupado() = self.altura() / 2
	method esParcelaIdeal(unaParcela) = unaParcela.horasDeSolQueRecibe() == self.horasDeSolQueTolera()
}

class Quinoa inherits Planta{
	var horasDeSolQueTolera  
	override method horasDeSolQueTolera() = horasDeSolQueTolera
	override method segundaCondicion() = self.anioDeObtencionDeSemilla() < 2005
	override method espacioOcupado() = 0.5
	method esParcelaIdeal(unaParcela) = unaParcela.plantas().all({planta => planta.altura() < 1.5})
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esParcelaIdeal(unaParcela) = unaParcela.capacidadMaximaDePlantasQueTolera() == 1
}

class HierbaBuena inherits Menta {
	override method espacioOcupado() = self.espacioOcupado() * 2
}