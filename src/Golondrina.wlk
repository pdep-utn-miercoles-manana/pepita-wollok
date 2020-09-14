import Ciudad.*
import estadosDeAnimo.*

class Golondrina {
	var property energia
	
	var property ciudadActual
	var property diarioDeViaje = []
	
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
			self.llegarA(unaCiudad)
		}
	}
	
	method llegarA(unaCiudad){
		ciudadActual = unaCiudad
		diarioDeViaje.add(unaCiudad)
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
	
	method tieneSuficienteEnergia(unaEnergia){
		return self.energia() > unaEnergia
	}
	
	method estuvoEn(unaCiudad){
		return diarioDeViaje.contains(unaCiudad)
	}
}
