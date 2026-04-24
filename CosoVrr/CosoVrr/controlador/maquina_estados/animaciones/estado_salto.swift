//
//  estado_salto.swift
//  CosoVrr
//
//  Created by alumno on 4/20/26.
//

class SaltoAnimacion: Estado{
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre = "Salto"
    
    init(){
       
    }
    
    func inicializar() {
        print("Wenas desde el saltito")
    }
    
    func actualizar(_ estado: String) {    }
    
    func finalizar() {}
    
    func reaccion(estimulo: String) {
        
    }
    
    
}
