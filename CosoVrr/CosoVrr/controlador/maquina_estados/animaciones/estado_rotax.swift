//
//  estado_rotax.swift
//  CosoVrr
//
//  Created by alumno on 4/27/26.
//

class RotaXAnimacion: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    
    static let nombre: String = "RotarX"
    
    init(){
   
    }
    
    func inicializar() {    }
    
    func actualizar(_ evento: String) {
        
        if evento == "rotaX"{
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "rotaX"))
            contexto?.realizar_cambio_estado(a: RotaXAnimacion.nombre)
        }
    }
    
    func finalizar() {  }
    
    func reaccion(estimulo: String) {  }
    
    
}
