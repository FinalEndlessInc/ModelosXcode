//
//  controlador_notificacion.swift
//  CosoVrr
//
//  Created by alumno on 4/17/26.
//

import SwiftUI
import RealityKit

extension ControladorAplicacion{
    func activar_comportamiento(_ nombre: String){
        estados_animacion.actualizar(nombre)
    }
    
    func escuchar_comportamiento(_ nombre: String){
        print("nombre de finalizacion comportamiento: \(nombre)")
        
        estados_animacion.actualizar(nombre)
    }
}
