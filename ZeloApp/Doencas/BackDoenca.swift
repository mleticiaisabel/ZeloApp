//
//  BackDoenca.swift
//  ZeloApp
//
//  Created by Alysson Lucas dos Anjos Silva on 03/07/26.
//

import SwiftUI

enum InfodoencaDuration: String, CaseIterable, Identifiable {
    case aguda = "Aguda"
    case cronica = "Crônica"
    case recorrente = "Recorrente"
    case naoDefinida = "Não Definida"
 
    var id: String { rawValue }
}
 
enum InfodoencaStatus: String, CaseIterable, Identifiable {
    case ativa = "Ativa"
    case emTratamento = "Em tratamento"
    case controlada = "Controlada"
    case emRemissao = "Em remissão"
    case resolvida = "Resolvida"
    case naoDefinida = "Não definida"
 
    var id: String { rawValue }
}
 
struct Medication: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var dosage: String = ""
}
 
struct InfodoencaFormModel {
    var name: String = ""
    var duration: InfodoencaDuration = .naoDefinida
    var origin: String = ""
    var status: InfodoencaStatus = .naoDefinida
    var symptoms: String = ""
    var medications: [Medication] = []
    var importantCare: String = ""
    var moreInfo: String = ""
}
