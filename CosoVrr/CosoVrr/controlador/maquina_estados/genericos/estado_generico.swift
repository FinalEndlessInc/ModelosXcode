//
//  estado_generico.swift
//  CosoVrr
//
//  Created by alumno on 4/20/26.
//

protocol Estado{
    var contexto: MaquinaEstadosGenerica? {get set}
    
    func inicializar() -> Void
    
    func actualizar(_ estado: String) -> Void
    
    func finalizar() -> Void
    
    func reaccion(estimulo: String) -> Void
}
