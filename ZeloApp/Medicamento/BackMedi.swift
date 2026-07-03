//
//  BackMedi.swift
//  ZeloApp
//
//  Created by Alysson Lucas dos Anjos Silva on 03/07/26.
//

import SwiftUI

enum TipoMedicamento: String, CaseIterable, Identifiable {
    case capsula = "Cápsula"
    case comprimido = "Comprimido"
    case liquido = "Líquido"
    case pomada = "Pomada"

    var id: String { rawValue }
}

enum UnidadeMedicamento: String, CaseIterable, Identifiable {
    case mg = "mg"
    case mcg = "mcg"
    case g = "g"
    case ml = "mL"
    case percentual = "%"

    var id: String { rawValue }
}

enum FrequenciaMedicamento: String, CaseIterable, Identifiable {
    case todosOsDias = "Todos os Dias"
    case diasEspecificos = "Dias Específicos"

    var id: String { rawValue }
}

struct RemedioFormModel {
    var name: String = ""
    var tipo: TipoMedicamento? = nil
    var outroTipo: String = ""
    var dosagem: String = ""
    var unidade: UnidadeMedicamento? = nil
    var horarios: [Date] = []
    var frequencia: FrequenciaMedicamento = .todosOsDias
    var dataInicio: Date? = nil
    var dataTermino: Date? = nil
}
