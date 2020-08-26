object pepita {
	var property energia = 100
	
	var ciudadActual = buenosAires
	
	method comer(gramosDeAlpiste) {
		energia = energia + 2 * gramosDeAlpiste
	}
	
	method volar(unosKilometros) {
		if (self.puedeVolar(unosKilometros)) {
			energia = energia - self.estadoAnimo().energiaQueGastariaAlVolar(unosKilometros)
		}
	}
	
	method volarA(unaCiudad) {
		const unosKilometros = ciudadActual.distanciaA(unaCiudad)
		if (self.puedeVolar(unosKilometros)) {
			self.volar(unosKilometros)
			ciudadActual = unaCiudad
		}
	}
	
	method puedeVolar(unosKilometros) {
		return self.energia() > self.estadoAnimo().energiaQueGastariaAlVolar(unosKilometros)
	}
	
	method hacerDeseo() {
		self.estadoAnimo().cumplirDeseo(self)
	}
	
	method estadoAnimo() {
		if (self.estaEuforica()) {
			return euforica
		} else if (self.estaDebil()) {
			return debil
		} else {
			return normal
		}
	}
	
	method estaEuforica() {
		return self.energia() > 500 && self.energia().even()
	}
	
	method estaDebil() {
		return self.energia() < 50
	}
}

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