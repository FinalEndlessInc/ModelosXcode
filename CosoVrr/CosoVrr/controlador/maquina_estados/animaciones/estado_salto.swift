//
//  estado_salto.swift
//  CosoVrr
//
//  Created by alumno on 4/20/26.
//

class SaltoAnimacion: Estado{
    var contexto: any MaquinaEstadosGenerica
    
    static let nombre = "Salto"
    
    init(_ contexto: MaquinaEstadosGenerica){
        self.contexto = contexto
    }
    
    func inicializar() {
        print("Wenas desde el saltito")
    }
    
    func actualizar(_ estado: String) {    }
    
    func finalizar() {}
    
    func reaccion(estimulo: String) {
        <#code#>
    }
    
    
}
