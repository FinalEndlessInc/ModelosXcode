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
    var body: some View {
        ZStack{
            RealityView{ raiz_de_escena in
                if let modelo_cubo = try? await Entity( named: "escena", in: mundo_virtualBundle){
                    modelo_cubo.position.z = lejitud
                    modelo_cubo.position.y = -0.5
                    raiz_de_escena.add(modelo_cubo)
                }else{
                    print("no carga")
                }
                
            }
        }
        
        Slider(value: $lejitud)
        
    }
}

#Preview {
    ContentView()
}
