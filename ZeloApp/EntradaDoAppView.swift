//
//  ContentView.swift
//  ZeloApp
//  Created by Maria Letícia Isabel Gonçalves  on 25/06/26.
//

import SwiftUI

struct EntradaDoAppView: View {
    
    @State private var temFotoDaCrianca: Bool = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
//  o columns está dizendo para a grade: "Use aquele molde que eu criei ali em cima". botei dois GridItem naquele molde, ou seja, a grade entende automaticamente que deve dividir o espaço da tela em duas colunas de tamanhos iguais (.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack {
                    LinearGradient(
                        colors: [
                            Color.green.opacity(0.60),
                            Color.green.opacity(0.09),
                            Color(.clear)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 240)
                    Spacer()
                }
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Data de acordo com o dia e em PT
                        Text(Date(), format: .dateTime.weekday(.wide).day().month(.wide))
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .environment(\.locale, Locale(identifier: "pt_BR"))
                            .textCase(.uppercase)
                            .bold()
                            .padding(.horizontal, 19)
                            .padding(.top, 8)
                        
                        // Título de dados referente a criança
                        Text("Sobre ")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 19)
                            .padding(.top, 4)
                        
                        // Card de dados pessoais
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(spacing: 16) {
                                
                                if temFotoDaCrianca {
                                    Image("foto_crianca")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                    
                                } else {
                                    ZStack {
                                        Circle()
                                            .fill(Color(uiColor: .tertiarySystemGroupedBackground))
                                            .frame(width: 60, height: 60)
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 28))
                                            .foregroundStyle(Color(uiColor: .systemGray3))
                                    }
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Dados Pessoais da Criança")
                                        .font(.headline)
                                        .bold()
                                        .foregroundStyle(.primary)
                                    
                                    Text("Nenhuma informação adicionada.")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                    
                                }
                            }
                            
                            Divider()
                            
                            Button(action: {}) {
                                Text("+ Adicionar dados pessoais")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundStyle(.blue)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(minHeight: 140)
                        .background(Color(uiColor: .secondarySystemGroupedBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                        .padding(.horizontal, 19)
                        
                        // TÍTULO DA SEÇÃO DA SAÚDE DA CRIANCINHA
                        Text("Acompanhamento")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 19)
                            .padding(.top, 8)
                        
                        //  isso daqui é para fazer os cards iguais. A tela EntradaDoApp vai até a lista da tela CategoriaItem e diz: "Pegue apenas os 4 primeiros itens (Medicamento, Alergia, Condições e Doenças) e crie um cartãozinho no grid para cada um". Ele usa o item.icone, item.titulo, etc., para preencher o visual
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(minhasCategorias.prefix(4)) { item in
                                NavigationLink(value: item.destino) {
                                    VStack(alignment: .leading, spacing: 12)
                                    {
                                        HStack(spacing: 6) {
                                            Image(systemName: item.icone)
                                                .foregroundStyle(item.corIcone)
                                                .font(.body)
                                                .bold()
                                            
                                            Text(item.titulo.uppercased())
                                                .font(.caption2)
                                                .bold()
                                                .foregroundStyle(.primary)
                                        }
                                        
                                        Text(item.descricao)
                                            .font(.system(size: 11))
                                            .foregroundStyle(.secondary)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                        
                                        Text("0 ativos")
                                            .font(.system(size: 10, weight: .bold))
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 4)
                                            .background(Color.green.opacity(0.12))
                                            .foregroundStyle(.green)
                                            .clipShape(Capsule())
                                    }
                                    .padding(16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 160)
                                    .background(Color(uiColor: .secondarySystemGroupedBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                                }
                                .buttonStyle(PlainButtonStyle())
                                // isso daqui remove a cor azul do botao
                            }
                        }
                        .padding(.horizontal, 19)
                        
                        // SEÇÃO DE EMERGÊNCIA
                        Text("Emergência")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 19)
                            .padding(.top, 12)
                        
                        // CONTATO DE EMERGÊNCIA
                        if let emergencia = minhasCategorias.last {
                            NavigationLink(value: emergencia.destino) {
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack(spacing: 6) {
                                        Image(systemName: emergencia.icone)
                                            .foregroundStyle(emergencia.corIcone)
                                            .font(.title3)
                                            .bold()
                                        
                                        Text(emergencia.titulo.uppercased())
                                            .font(.subheadline)
                                            .bold()
                                            .foregroundStyle(.primary)
                                    }
                                    
                                    Text(emergencia.descricao)
                                        .font(.system(size: 12))
                                        .foregroundStyle(.secondary)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                    Text("0 ativos")
                                        .font(.system(size: 10, weight: .bold))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(Color.green.opacity(0.12))
                                        .foregroundStyle(.green)
                                        .clipShape(Capsule())
                                    
                                    //   para mexer no retangulo de emergencia
                                }
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(minHeight: 120, alignment: .center)
                                .background(Color(uiColor: .secondarySystemGroupedBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.horizontal, 19)
                            .padding(.bottom, 24)
                        }
                    }
                }
                .navigationTitle("Resumo")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {} label: {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(Color.green)
                        }
                        //                .toolbar {
                        //                    ToolbarItem(placement: .navigationBarTrailing) {
                        //                        Button {
                        //                            // COMPARTILHAR
                        //                        } label: {
                        //                            Image(systemName: "square.and.arrow.up")
                        //                                .font(.body)
                        //                                .bold()
                        //                                .foregroundStyle(Color.green)
                        //                                .padding(8)
                        //                                .background(Color(uiColor: .secondarySystemGroupedBackground))
                        //                                .clipShape(Circle())
                    }
                }
            }
        }
    }
}
//}
#Preview {
    EntradaDoAppView()
}

