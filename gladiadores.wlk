
import armas.*
import grupos.*
class Mirmillones{
    var vida = 100
    const property arma
    var property armadura
    var property fuerza
    method destreza() = 15

    method vida() = vida

    method pelear(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method atacar(unGladiador){
        unGladiador.recibirAtaque(self.poderDeAtaque() )
       
    }

    method poderDeAtaque() = arma.poderDeAtaque() + fuerza
    method defensa() = armadura.defensa(self) + self.destreza()

    method recibirAtaque(unValor) {
        vida = vida - 0.max(unValor - self.defensa())
    }

    method puedePelear() = vida > 0

    method crearUnGrupo(otroGladiador) {
        const nuevoGrupo = new Grupo(
            gladiadores=[self,otroGladiador],
            nombre = "mirmillolandia"
        )
        return nuevoGrupo
    }
}

class Dimachaerus {
    var vida = 100
    const property armas =[]
    var property destreza
    method fuerza() = 10

    method vida() = vida

    method pelear(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method atacar(unGladiador){
        unGladiador.recibirAtaque(self.poderDeAtaque())       
        destreza = destreza + 1
    }

    method poderDeAtaque() = self.fuerza() + armas.sum( 
        { arma => arma.poderDeAtaque()}
        )
    method defensa() = destreza * 0.5
    method recibirAtaque(unValor) {
        vida = vida - 0.max(unValor - self.defensa())
    }

     method puedePelear() = vida > 0

    method crearUnGrupo(otroGladiador) {
        const nuevoGrupo = new Grupo(
            gladiadores=[self,otroGladiador],
            nombre = "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque())
        )
        return nuevoGrupo   
    }
     
}