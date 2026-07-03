//
// DadosPessoaisView.swift
// ZeloApp
//
// Created by Maria Letícia Isabel Gonçalves on 02/07/26.
//
import SwiftUI
import PhotosUI
struct DadosPessoaisView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var itemSelecionado: PhotosPickerItem? = nil
    @State private var imagemSelecionada: UIImage? = nil
    @State private var nome: String = ""
    @State private var dataNascimento: Date = Date()
    @State private var generoSelecionado: String = "Não Informado"
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var cpf: String = ""
    @State private var cartaoSus: String = ""
    @State private var cartaoPlano: String = ""
    
    // ista de gêneros que estava faltando no escopo
    let generos = ["Masculino", "Feminino", "Não-binário", "Outro", "Não Informado"]
    
    // Cálculo dinâmico da idade que estava faltando no escopo
    var idadeCalculada: Int {
        let calendario = Calendar.current
        let componentes = calendario.dateComponents([.year], from: dataNascimento, to: Date())
        return componentes.year ?? 0
    }
    var body: some View {
        NavigationStack {
            
            // Apenas UM Form principal cuidando de todas as seções
            Form {
                
                // SEÇÃO DA FOTO
                Section {
                    PhotosPicker(selection: $itemSelecionado, matching: .images) {
                        VStack(spacing: 12) {
                            if let imagem = imagemSelecionada {
                                Image(uiImage: imagem)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            } else {
                                VStack(spacing: 10) {
                                    Image(systemName: "photo.badge.plus")
                                        .font(.system(size: 36))
                                        .foregroundStyle(.green)
                                    Text("Selecionar Foto")
                                        .font(.headline)
                                        .foregroundStyle(.green)
                                    Text("Escolha uma imagem da sua fototeca")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 120)
                            }
                        }
                    }
                }
                Section("Identificação") {
                    TextField("Nome Completo", text: $nome)
                        .textContentType(.name)
                    DatePicker("Data de Nascimento", selection: $dataNascimento, displayedComponents: .date)
                        .environment(\.locale, Locale(identifier: "pt_BR"))
                    HStack {
                        Text("Idade")
                        Spacer()
                        Text("\(idadeCalculada) anos")
                            .foregroundStyle(.secondary)
                    }
                    Picker("Gênero", selection: $generoSelecionado) {
                        ForEach(generos, id: \.self) { genero in
                            Text(genero).tag(genero)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("Dados Físicos") {
                    HStack {
                        Text("Peso (kg)")
                        TextField("0.0", text: $peso)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Altura (cm)")
                        TextField("0", text: $altura)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                }
                Section("Documentos e Planos") {
                    TextField("CPF", text: $cpf)
                        .keyboardType(.numberPad)
                    TextField("Número do Cartão do SUS", text: $cartaoSus)
                        .keyboardType(.numberPad)
                    TextField("Número do Cartão do Plano", text: $cartaoPlano)
                        .keyboardType(.numberPad)
                }
            }
            // Modificadores aplicados corretamente no Form principal
            .navigationTitle("Dados Pessoais")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        salvarDados()
                    } label: {
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                    }
                    .disabled(nome.isEmpty)
                }
            }
            .onChange(of: itemSelecionado) { _, novoItem in
                Task {
                    if let data = try? await novoItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        imagemSelecionada = uiImage
                    }
                }
            }
        }
    }
    func salvarDados() {
        print("Salvando perfil de:", nome)
        print("Idade real:", idadeCalculada)
        print("CPF:", cpf)
        dismiss()
    }
}
#Preview {
    DadosPessoaisView()
}
