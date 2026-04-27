//
//  estados_animacion.swift
//  CosoVrr
//
//  Created by alumno on 4/20/26.
//

class MaquinaEstadosAnimacion: MaquinaEstadosGenerica{
    var controlador_general: (any ProcesarComandos)?
    
    var estados_disponibles: [String: Estado] = [
        ReposoAnimacion.nombre: ReposoAnimacion(),
        SaltoAnimacion.nombre: SaltoAnimacion(),
        CalacasDesaparecidas.nombre: CalacasDesaparecidas(),
        CalacasEstiradas.nombre: CalacasEstiradas(),
        RotaXAnimacion.nombre: RotaXAnimacion()
        
    ]
    var estado_actual: Estado? = nil
    
    init(){
        estado_actual = estados_disponibles[ReposoAnimacion.nombre]
        estado_actual?.contexto = self
    }
    
    func realizar_cambio_estado(a nombre_del_estado_nuevo: String) {
        guard let estado_nuevo = estados_disponibles[nombre_del_estado_nuevo] else{
            fatalError("Parecer que el estado \(nombre_del_estado_nuevo) no esta disponible o registrado")
        }
        
        estado_actual?.finalizar()
        
        estado_nuevo.inicializar()
        
        estado_actual = estado_nuevo
        
        return
    }
    
    func actualizar(_ evento: String){
        estado_actual?.actualizar(evento)
    }
    
    func enviar_peticion(_ comando: Comando) -> Bool {
        guard let respuesta = controlador_general?.realizar_comando(comando) else{
            return false
        }
        
        return respuesta
    }
    
    
}
