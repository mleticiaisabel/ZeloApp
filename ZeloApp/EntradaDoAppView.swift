//
//  ContentView.swift
//  ZeloApp
//  Created by Maria Letícia Isabel Gonçalves  on 25/06/26.
//

import SwiftUI

struct EntradaDoAppView: View {
    
    @State private var temFotoDaCrianca: Bool = false
    @State private var mostrarDadosPessoais: Bool = false
    
    // Eu criei esse estado para monitorar qual card o usuário tocou.
    // Quando ele estiver "vazio" (nil), a minha modal (sheet) fica escondida.
    // Quando eu coloco uma categoria aqui, o SwiftUI entende que precisa abrir a tela correspondente.
    @State private var categoriaSelecionada: CategoriaItem?
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
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
                        VStack(alignment: .leading, spacing: 16){
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
                            
                            Button(action: {
                            mostrarDadosPessoais = true
                            }) {
                            Text("+ Adicionar dados pessoais")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.blue)
                            }
                            .sheet(isPresented: $mostrarDadosPessoais) {
                            DadosPessoaisView()
                            
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(minHeight: 140)
                        .background(Color(uiColor: .secondarySystemGroupedBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                        .padding(.horizontal, 19)
                        
                        Text("Acompanhamento")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 19)
                            .padding(.top, 8)
                        
                        // No meu grid de Acompanhamento, eu troquei o NavigationLink por um Button comum.
                        // Eu fiz isso porque o NavigationLink serve para empurrar uma nova tela lateralmente,
                        // enquanto o Button me dá a liberdade de disparar qualquer ação — que no meu caso,
                        // é salvar qual card foi clicado para abrir a minha janela modal (sheet).
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(minhasCategorias.prefix(4)) { item in
                                Button {
                                    // Aqui eu guardo o item atual que foi clicado. Isso avisa ao SwiftUI que a minha sheet deve abrir.
                                    categoriaSelecionada = item
                                } label: {
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
                            }
                        }
                        .padding(.horizontal, 19)
                        
                        Text("Emergência")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 19)
                            .padding(.top, 12)
                        
                        // Eu fiz o mesmo processo aqui no card de Emergência.
                        // Eu mudei para ele deixar de ser um link de navegação padrão e passar a ser um botão interativo.
                        if let emergencia = minhasCategorias.last {
                            Button {
                                // Ao clicar, eu informo que a categoria de emergência foi selecionada.
                                categoriaSelecionada = emergencia
                            } label: {
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack(spacing: 6) {
                                        Image(systemName: "pills.fill")
                                            .foregroundStyle(emergencia.corIcone)
                                         
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
                // O meu modificador '.sheet' fica escutando a variável 'categoriaSelecionada' que eu criei.
                // Assim que ela recebe um valor, a modal desliza para cima.
                // Eu usei o 'switch' para ler o título da categoria que foi tocada e injetar a View correta lá dentro.
                .sheet(item: $categoriaSelecionada) { itemSelecionado in
                    switch itemSelecionado.titulo.uppercased() {
                    case "MEDICAMENTO":
                        MedicamentoView()
                    case "ALERGIA":
                        AlergiasView()
                    case "CONDIÇÕES":
                        CondicoesView()
                    case "DOENÇAS":
                        DoencasView()
                    case "CONTATOS DE EMERGÊNCIAS":
                        ContatoDeEmergencia()
                    default:
                        Text("Página \(itemSelecionado.titulo) não encontrada.")
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

                    }
                }
            }
        }
    }
}

#Preview {
    EntradaDoAppView()
}

