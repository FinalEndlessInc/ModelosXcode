//
//  CosoVrrApp.swift
//  CosoVrr
//
//  Created by alumno on 4/13/26.
//

import SwiftUI

@main
struct CosoVrrApp: App {
    @State var controlador_general = ControladorAplicacion()
    var body: some Scene {
        WindowGroup {
            SeguimientoImagenes()
                .environment(controlador_general)
        }
    }
}
