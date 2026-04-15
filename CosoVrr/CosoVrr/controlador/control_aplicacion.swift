//
//  control_aplicacion.swift
//  CosoVrr
//
//  Created by alumno on 4/15/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

@Observable
@MainActor
public class ControladorAplicacion{
    public var escenario: Entity? = nil
    public var raiz_escena: Entity = Entity()
    
    public var estado: EstadosAplicacion = .iniciando
    
    private var planetas_cargados: [Entity] = []
    
    init(){
        Task.detached(priority: .high){
            await self.cargar_planetas()
        }
    }
    
    func cargar_planetas() async{
        defer{      // se ejecuta cuando acaba todo lo demas de la funcion
            estado = .todo_cargado
        }
        
        var contador_bucle_for = 0
        
        for planeta in planetas{
            guard let planeta = try? await Entity(named: planeta , in: MundoVirtual) else{
                fatalError("No se ha podido cargar la calaca en \(#function)")
            }
            
            planeta.position.y = Float(contador_bucle_for / 3) * 0.3
            planeta.position.x = Float(contador_bucle_for % 3) * 0.3
            
            raiz_escena.addChild(planeta)
            
            planetas_cargados.append(planeta)
            
            contador_bucle_for += 1
        }
    }
    
    func alejar_planetas(lejitud: Float){
        for planeta_cargado in planetas_cargados {
            planeta_cargado.position.z = -lejitud
        }
    }
}
