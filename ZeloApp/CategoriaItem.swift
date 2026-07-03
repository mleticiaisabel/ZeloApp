//
//  MinhasCategorias.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 01/07/26.
//

import SwiftUI

enum TipoDeDestino: Hashable {
/* esse "ENUM" é basicamente um mapa de todas as rotas possíveis saindo da sua tela principal, acredito que podemos chamar ele de banco de dado local...(eu acho, rs)
 
  Lista as opções exatas de para onde o aplicativo pode ir quando o usuário clica em um botão. */
    case medicamentos
    case alergias
    case condicoes
    case doencas
    case contatosdeemergência
}
struct CategoriaItem: Identifiable, Hashable {
    let id = UUID()
    let titulo: String
    let descricao: String
    let icone: String
    let corIcone: Color
    let destino: TipoDeDestino
//   essa struct diz que toda categoria do app precisa obrigatoriamente ter um ID, título, descrição, um ícone, uma cor e, mais importante, um destino (tirado do Enum acima).
}

let minhasCategorias = [
    CategoriaItem(titulo: "Medicamento", descricao: "Cadastre medicamentos, doses e horários para acompanhar o tratamento.", icone: "pills.fill", corIcone: .indigo, destino: .medicamentos),
    CategoriaItem(titulo: "Alergia", descricao: "Registre alergias, reações e orientações importantes para o cuidado.", icone: "allergens", corIcone: .red, destino: .alergias),
    CategoriaItem(titulo: "Condição Médica", descricao: "Adicione condições físicas, motoras ou de saúde que mereçam atenção.", icone: "heart.text.square.fill", corIcone: .brown, destino: .condicoes),
    CategoriaItem(titulo: "Doenças", descricao: "Se a criança estiver doente, insira aqui o que está havendo...", icone: "thermometer.medium", corIcone: .orange, destino: .doencas),
    CategoriaItem(titulo: "Contatos de Emergências", descricao: "Cadastre pessoas que podem ser acionadas emsituações de emergência.", icone: "sos.circle.fill", corIcone: .red, destino: .contatosdeemergência)
]
