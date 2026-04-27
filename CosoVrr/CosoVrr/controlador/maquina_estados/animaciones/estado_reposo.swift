//
//  estado_reposo.swift
//  CosoVrr
//
//  Created by alumno on 4/20/26.
//

class ReposoAnimacion: Estado{
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre: String = "Reposo"
    
    
    func inicializar() {    }
    
    func actualizar(_ evento: String) {
        //print("\(#function) recibiendo informacion del tipo evento con datos \(evento)")
        
        switch evento{
            case "boing":
                contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "boing"))
                contexto?.realizar_cambio_estado(a: SaltoAnimacion.nombre)
            case "desaparece":
                contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "desaparecer"))
                contexto?.realizar_cambio_estado(a: CalacasDesaparecidas.nombre)
            
            case "estiramiento":
                contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "estiramiento"))
                contexto?.realizar_cambio_estado(a: CalacasEstiradas.nombre)
            
            case "rotaX":
                contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "rotaX"))
                contexto?.realizar_cambio_estado(a: RotaXAnimacion.nombre)
            
            default:
                print("Comando no especificado")
        }
    }
    
    func finalizar() {  }
    
    func reaccion(estimulo: String) {  }
    
    
}
