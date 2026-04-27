//
//  trackeo_imagenes.swift
//  CosoVrr
//
//  Created by alumno on 4/24/26.
//

import SwiftUI
import RealityKit

struct SeguimientoImagenes: View {
    var body: some View {
        RealityView{ contenido in
            contenido.camera = .spatialTracking
            
            let ancla = AnchorEntity(.image(group: "imagenes", name: "calaca") )
            
            let modelo_a_colocar = ModelEntity(mesh: .generateBox(size: 0.75), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
            
            ancla.addChild(modelo_a_colocar)
            contenido.add(ancla)
        }
        .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded({
            accion_realizada in
            print("Accion realizada es: \(accion_realizada.entity)")
        }))
        .background(Color.black)
    }
}

#Preview {
    SeguimientoImagenes()
}
