//
//  ContentView.swift
//  CosoVrr
//
//  Created by alumno on 4/13/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

struct ContentView: View {
    @State var lejitud: Float = 0
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack{
            Rectangle()
            HStack{
                switch controlador.estado{
                    case .iniciando:
                        Text("Cargando aplicacion, espera un ratico").foregroundStyle(Color.pink)
                    
                    case .todo_cargado:
                        RealityView{ raiz_de_escena in
                            raiz_de_escena.add(controlador.raiz_escena)
                    }
                        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("RealityKit.NotificationTrigger"))){ notificacion in
                            guard let notificacion = notificacion.userInfo?["RealityKit.NotificationTrigger.Identifier"] as? String else{ return }
                            controlador.escuchar_comportamiento(notificacion)
                        }
                }
            }
        }
        
        Slider(value: $lejitud, in: 0...5)
        HStack{
            Button{
                controlador.alejar_planetas(lejitud: lejitud)
            }label:{
                Text("Alejar calacas").foregroundStyle(Color.red)
            }
            
            Button{
                controlador.realizar_comando(tipo: .activar_animacion, carga_util: "boing")
            }label:{
                Text("Salten calaquitas").foregroundStyle(Color.blue)
            }
            
            Button{
                controlador.realizar_comando(tipo: .activar_animacion, carga_util: "rotaX")
            }label:{
                Text("Roten cabron calacas").foregroundStyle(Color.blue)
            }
            
            Button{
                controlador.realizar_comando(tipo: .activar_animacion, carga_util: "desaparece")
            }label:{
                Text("Vayanse, shuu").foregroundStyle(Color.blue)
            }
            
            
            Button{
                controlador.realizar_comando(tipo: .activar_animacion, carga_util: "estiramiento")
            }label:{
                Text("Estirense calacas").foregroundStyle(Color.blue)
            }
            
        }
        
        HStack{
            ForEach(controlador.historial_comandos){ comando in
                Text("Comando ejecutando \(comando.carga_util)")
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
