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
    public var escenario: RealityViewCameraContent? = nil
    
    public var raiz_escena: Entity = Entity()
    
    public var estado: EstadosAplicacion = .iniciando
    
    private var planetas_cargados: [Entity] = []
    var entidades_ancla: [AnchorEntity] = []
    
    public var historial_comandos: [Comando] = []
    
    var maquinas_de_estados: [MaquinaEstadosGenerica] = [MaquinaEstadosAnimacion()]
    
    init(){
        for indice in 0...maquinas_de_estados.count - 1{
            maquinas_de_estados[indice].controlador_general = self as ProcesarComandos
        }
        
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
    
    func actualizar_estados(_ mensaje: String){
        for maquina in maquinas_de_estados{
            maquina.actualizar(mensaje)
        }
    }
}
