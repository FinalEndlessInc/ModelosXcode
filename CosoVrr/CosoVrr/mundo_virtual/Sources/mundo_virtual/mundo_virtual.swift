import Foundation

/// Bundle for the mundo_virtual project
public let MundoVirtual = Bundle.module

public let escenario_calaca = "escena"

public let planetas = [
    "escena",
    "escena",
    "escena",
    "escena",
    "escena",
    "escena"
]

enum Notificaciones{
    case da_un_salto
}

let Notificacion: [Notificaciones: String] = [
    Notificaciones.da_un_salto: "boing"
]
