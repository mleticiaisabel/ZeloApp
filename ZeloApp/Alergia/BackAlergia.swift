//
//  BackAlergia.swift
//  ZeloApp
//
//  Created by Alysson Lucas dos Anjos Silva on 03/07/26.
//

import SwiftUI

enum AlergiaType: String, CaseIterable, Identifiable {
    case alimentar = "Alimentar"
    case ambiental = "Ambiental"
    case medicamentosa = "Medicamentosa"
    case naoDefinida = "Não definida"
    
    var id: String { rawValue }
}

enum AlergiaSeverity: String, CaseIterable, Identifiable {
    case leve = "Leve"
    case moderada = "Moderada"
    case grave = "Grave"
    case naoDefinida = "Não definida"
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .leve: return "Sintomas localizados e controláveis"
        case .moderada: return "Sintomas que exigem atenção"
        case .grave: return "Pode precisar de atendimento imediato"
        case .naoDefinida: return ""
        }
    }
}

struct AlergiaFormModel {
    var name: String = ""
    var type: String = ""
    var causingAgent: String = ""
    var severity: AlergiaSeverity = .naoDefinida
    var reactionSymptom: String = ""
    var medications: [Medication] = []
    var importantCare: String = ""
    var moreInfo: String = ""
}
