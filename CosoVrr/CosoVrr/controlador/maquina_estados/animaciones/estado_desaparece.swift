//
//  estado_desaparece.swift
//  CosoVrr
//
//  Created by alumno on 4/27/26.
//

class CalacasDesaparecidas: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    
    static let nombre: String = "Desaparecer"
    
    init(){
   
    }
    
    func inicializar() {    }
    
    func actualizar(_ evento: String) {
        
        if evento == "desaparece"{
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "desaparece"))
            contexto?.realizar_cambio_estado(a: CalacasDesaparecidas.nombre)
        }
    }
    
    func finalizar() {  }
    
    func reaccion(estimulo: String) {  }
    
    
}
