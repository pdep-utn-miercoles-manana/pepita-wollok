class Ciudad {
	
	var property kilometroEnRuta

	method distanciaA(otraCiudad) {
		return (otraCiudad.kilometroEnRuta() - self.kilometroEnRuta()).abs()
	}

}
