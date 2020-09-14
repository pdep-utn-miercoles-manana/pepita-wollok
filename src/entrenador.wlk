import Golondrina.*

//KISS - Keep it simple stupid

object carlos {
	
	const property aves = #{}
		
	method agregarAve(ave){
		aves.add(ave)
	}
	
	method cantidadDeAves(){
		return aves.size()
	}
	
	//carlos también quiere poder llamar a cualquiera de sus aves con un silbido
	method silbar(){
		return aves.anyOne()
	}
	
	//Saber si todas sus aves estan listas para competir
	//Estan listas si -> Tienen mas de 100 de energia
	method estaListoParaCompetir(){
		return aves.all({ave => ave.tieneSuficienteEnergia(100)})
	}
	
	method estaListoParaCompetir2(){
		return aves.all({ave => ave.energia() > 100})
	}

	//carlos quiere ver cómo están sus aves. entonces recuerda map de Haskell, y les dice que que le digan su estado de ánimo
	method estadosDeAnimoDelEquipo(){
		return aves.map({ave => ave.estadoAnimo()})
	}
	
// 	MAL!!		
//	method estadosDeAnimoDelEquipo2(){
//		return aves.forEach({ave => ave.estadoAnimo()})
//	}

	method alimentarEquipo(gramosAlpiste){

//		const bloque = object {
//			method apply(ave){
//				ave.comer(gramosAlpiste)
//			}
//		}
		
		// Es lo mismo que hacer
		const bloque = {ave => ave.comer(gramosAlpiste)}
		
		aves.forEach(bloque)
		
	}
	
	//MAL!!!!!!
//	method alimentarEquipo2(gramosAlpiste){
//		const bloque = {ave => ave.comer(gramosAlpiste)}
//		aves.map(bloque)
//	}
	
	method equipoConSuficienteEnergia(energia){
		return aves.filter({ave => ave.tieneSuficienteEnergia(energia)})
	}
	
	// Carlos arma el equipo ideal para una ciudad, con las aves que tiene mas de 150 de energia
	// y ademas que hayan estado en esa ciudad 
	method equipoIdealPara(unaCiudad){
		return aves.filter({ ave => ave.tieneSuficienteEnergia(150) && ave.estuvoEn(unaCiudad)})
	}
	
	method equipoIdealPara2(unaCiudad){
		return self.equipoConSuficienteEnergia(150).filter({ave =>  ave.estuvoEn(unaCiudad)})
		
		//MAL!!
		//return self.equipoConSuficienteEnergia(150).filter({ave =>  ave.diarioDeViaje().contains(unaCiudad)})
	}
}