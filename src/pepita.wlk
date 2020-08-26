object pepita {
	var energia = 100
	var ciudadActual = buenosAires
	
	method energia() {
		return energia 
 	}

	method comer(gramosDeAlpiste) {
		energia = energia + 2 * gramosDeAlpiste
	}
	
	method volar(unosKilometros) {
		if (self.puedeVolar(unosKilometros)) {
			energia = energia - self.energiaQueGastariaAlVolar(unosKilometros)
		}
	}
	
	method energiaQueGastariaAlVolar(unosKilometros) {
		return unosKilometros / 8 + 10
	}
	
	method volarA(unaCiudad) {
		const unosKilometros = ciudadActual.distanciaA(unaCiudad)
		if (self.puedeVolar(unosKilometros)) {
			self.volar(unosKilometros)
			ciudadActual = unaCiudad
		}
	}
	
	method puedeVolar(unosKilometros) {
		return self.energia() > self.energiaQueGastariaAlVolar(unosKilometros)
	}
}

object buenosAires {

	method distanciaA(otraCiudad) {
		return gps.distanciaEntre(self, otraCiudad)
	}

	method kilometroEnRuta() {
		return 0
	}
	
}


object mdp {

	method distanciaA(otraCiudad) {
		return gps.distanciaEntre(self, otraCiudad)
	}

	method kilometroEnRuta() {
		return 400
	}
		
}

object gps {
	
	method distanciaEntre(unaCiudad, otraCiudad) {
		return (otraCiudad.kilometroEnRuta() - unaCiudad.kilometroEnRuta()).abs()
	}
	
}