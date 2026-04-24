//
//  estado_reposo.swift
//  CosoVrr
//
//  Created by alumno on 4/20/26.
//

class ReposoAnimacion: Estado{
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre: String = "Reposo"
    
    init(){
   
    }
    
    func inicializar() {    }
    
    func actualizar(_ evento: String) {
        //print("\(#function) recibiendo informacion del tipo evento con datos \(evento)")
        
        if evento == "boing"{
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "boing"))
            contexto?.realizar_cambio_estado(a: SaltoAnimacion.nombre)
        }
    }
    
    func finalizar() {  }
    
    func reaccion(estimulo: String) {  }
    
    
}
