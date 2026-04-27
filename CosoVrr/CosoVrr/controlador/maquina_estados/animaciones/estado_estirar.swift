//
//  estado_estirar.swift
//  CosoVrr
//
//  Created by alumno on 4/27/26.
//

class CalacasEstiradas: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    
    static let nombre: String = "Estirar"
    
    init(){
   
    }
    
    func inicializar() {    }
    
    func actualizar(_ evento: String) {
        
        if evento == "estiramiento"{
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "estiramiento"))
            contexto?.realizar_cambio_estado(a: CalacasEstiradas.nombre)
        }
    }
    
    func finalizar() {  }
    
    func reaccion(estimulo: String) {  }
    
    
}
