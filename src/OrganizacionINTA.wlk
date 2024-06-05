import semillas.*
import parcelas.*

object inta {
	const parcelas = []
	method parcelas() = parcelas
	method agregarParcela(unaParcela){
		parcelas.add(unaParcela)
	}
	method cantidadDeParcelas() = parcelas.size()
	method cantidadDePlantasEnParcelas() = parcelas.sum({parcela => parcela.cantidadDePlantas()})
	method promedioDePlantas() = self.cantidadDePlantasEnParcelas() / self.cantidadDeParcelas()
	method parcelaMasAutosustentable() = parcelas.filter({parcela => parcela.cantidadDePlantas() > 4}).max({parcela => parcela.cantidadDePlantasAsociadas()})
}
