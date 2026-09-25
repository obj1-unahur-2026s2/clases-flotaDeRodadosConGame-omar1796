class Corsa{

  const color

  method capacidad() = 4

  method velocidadMaxima() = 150

  method peso() = 1300

  method color() = color


}

class Kwid {

  var tieneTanqueAdicional // = false
  //const combustible = "gas"
  const color = "Azul"

  const peso = 1200

  method capacidad() = if(tieneTanqueAdicional) 3 else 4

  /*method capacidad(){
    if(tieneTanqueAdicional){
      return 3
    }else{
      return 4
    }
  }
  */
  
  method velocidadMaxima() = if(tieneTanqueAdicional) 120 else 110

  method peso() = if(tieneTanqueAdicional) peso + 150 else peso

  method color() = color

  method instalarTanqueAdicional(){
    tieneTanqueAdicional = true
  }

  method quitarTanqueAdicional(){
    tieneTanqueAdicional = false 
  }

}

object traffic {

  var interior = interiorComodo
  var motor = motorPulenta

  method capacidad() = interior.capacidad()

  method velocidadMaxima() = motor.velocidadMaxima()

  method peso() = 4000 + interior.peso() + motor.peso()

  method color() = "Blanco"

  method cambiarInterior(nuevoInterior){
    interior = nuevoInterior
  }

  method cambiarMotor(nuevoMotor){
    motor = nuevoMotor
  }
}

object interiorComodo {

  method capacidad() = 5

  method peso() = 700
}

object interiorPopular {

  method capacidad() = 12

  method peso() = 1000
}

object motorPulenta {

  method peso() = 800

  method velocidadMaxima() = 130
}

object motorBataton {

  method peso() = 500

  method velocidadMaxima() = 80
}

class Dependencia {

  const flotaDeRodados = []

  const cantidadDeEmpleados

  method agregarAFlota(rodado){
    flotaDeRodados.add(rodado)
  }

  method quitarAFlota(rodado){
    flotaDeRodados.remove(rodado)
  }

  method pesoTotalDeFlota() = flotaDeRodados.sum({r => r.peso()})

  method estaBienEquipado(){
    return (flotaDeRodados.size() >= 3) && (flotaDeRodados.all({r => r.velocidadMaxima() >= 100}))
  }

  method capacidadTotalEnColor(color){
    return flotaDeRodados.filter({r => r.color() == color}).sum({r => r.capacidad()})
  }

  method colorDelRodadoMasRapido(){
    return flotaDeRodados.max({r => r.velocidadMaxima()}).color()
  }

  method capacidadFaltante() = cantidadDeEmpleados - flotaDeRodados.sum({r => r.capacidad()})

  method esGrande() = cantidadDeEmpleados >= 50 && flotaDeRodados.size() >= 5

}