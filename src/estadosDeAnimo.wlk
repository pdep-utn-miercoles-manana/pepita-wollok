object euforica {	
	method cumplirDeseo(unaGolondrina) {
		unaGolondrina.volar(5)
	}
		
	method energiaQueGastariaAlVolar(unosKilometros) {
		return unosKilometros / 5 + 10
	}
}

object debil {
	method cumplirDeseo(unaGolondrina) {
		unaGolondrina.comer(500)
	}
		
	method energiaQueGastariaAlVolar(unosKilometros) {
		return unosKilometros / 8 + 50
	}
}

object normal {
	method cumplirDeseo(unaGolondrina) {
		// Es un método vacío porque no hace nada
	}
		
	method energiaQueGastariaAlVolar(unosKilometros) {
		return unosKilometros / 8 + 10
	}
}