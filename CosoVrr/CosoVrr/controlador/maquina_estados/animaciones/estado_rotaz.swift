//
//  estado_rotaz.swift
//  CosoVrr
//
//  Created by alumno on 4/27/26.
//

class RotacionZAnimacion: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    
    static let nombre: String = "RotarZ"
    
    init(){
   
    }
    
    func inicializar() {    }
    
    func actualizar(_ evento: String) {
        
        if evento == "rotaZ"{
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "rotaZ"))
            contexto?.realizar_cambio_estado(a: RotacionZAnimacion.nombre)
        }
    }
    
    func finalizar() {  }
    
    func reaccion(estimulo: String) {  }
    
    
}
