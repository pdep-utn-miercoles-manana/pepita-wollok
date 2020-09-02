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

object dolores {

	method distanciaA(otraCiudad) {
		return gps.distanciaEntre(self, otraCiudad)
	}

	method kilometroEnRuta() {
		return 200
	}
		
}


object gps {
	
	method distanciaEntre(unaCiudad, otraCiudad) {
		return (otraCiudad.kilometroEnRuta() - unaCiudad.kilometroEnRuta()).abs()
	}
	
}