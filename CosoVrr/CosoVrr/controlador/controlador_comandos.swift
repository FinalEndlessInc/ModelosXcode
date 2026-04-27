//
//  controlador_comandos.swift
//  CosoVrr
//
//  Created by alumno on 4/17/26.
//

import SwiftUI


extension ControladorAplicacion: ProcesarComandos{
    func realizar_comando(tipo: Comandos, carga_util: String) -> Bool{
        switch tipo{
        case .activar_animacion:
            activar_comportamiento(carga_util)
            historial_comandos.append(Comando(tipo: tipo, carga_util: carga_util))
            return true
            
        default:
            print("\(#file):\(#function) NO has puesto esto we \(tipo)")
            return false
        }
        return false
    }
    
    func realizar_comando(_ comanda: Comando) -> Bool{
        switch comanda.tipo{
        case .activar_animacion:
            activar_comportamiento(comanda.carga_util)
            historial_comandos.append(
                comanda
            )
            return true
            
        default:
            print("\(#file):\(#function) NO has puesto esto we \(comanda.tipo)")
            return false
        }
        return false
    }
}
