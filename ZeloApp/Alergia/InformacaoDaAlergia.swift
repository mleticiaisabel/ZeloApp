//
//  InformacaoDaAlergia.swift
//  ZeloApp
//
//  Created by Alysson Lucas dos Anjos Silva on 02/07/26.
//

import SwiftUI


struct AlergiaFormView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var model: AlergiaFormModel
    
    init(initialName: String = "") {
        _model = State(initialValue: AlergiaFormModel(name: initialName))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome da alergia", text: $model.name)
                        .font(.headline)
                }
                Section {
                    TextField("Ex.: Alimentar, Ambiental...", text: $model.type)
                } header: {
                    Text("Tipo da Alergia")
                }
                Section {
                    TextField("Ex.: Amendoim, Ácaro, Dipirona...", text: $model.causingAgent)
                } header: {
                    Text("Agente Causador")
                }
                Section {
                    Picker(selection: $model.severity) {
                        ForEach(AlergiaSeverity.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    } label: {
                    }
                    .pickerStyle(.menu)
                    .tint(.blue)
                    
                    if !model.severity.description.isEmpty {
                        Text(model.severity.description)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Text("Gravidade da Alergia")
                }
                Section {
                    TextField(
                        "Ex.: Vermelhidão, Tosse, Coriza...",
                        text: $model.reactionSymptom,
                        axis: .vertical
                    )
                    .lineLimit(2...5)
                } header: {
                    Text("Reação e Sintoma")
                }
                Section {
                    ForEach(model.medications) { medication in
                        HStack {
                            Text(medication.name)
                            if !medication.dosage.isEmpty {
                                Spacer()
                                Text(medication.dosage)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        model.medications.remove(atOffsets: indexSet)
                    }
                    Button {
                    } label: {
                        Label("Adicione um Medicamento", systemImage: "plus.circle.fill")
                            .foregroundStyle(Color.green)
                    }
                } header: {
                    Text("Medicamentos Relacionados")
                }
                Section {
                    TextField(
                        "Ex.: Evitar dipirona...",
                        text: $model.importantCare,
                        axis: .vertical
                    )
                    .lineLimit(2...5)
                } header: {
                    Text("Cuidados Importantes")
                }
                Section {
                    TextField(
                        "Digite aqui...",
                        text: $model.moreInfo,
                        axis: .vertical
                    )
                    .lineLimit(2...6)
                } header: {
                    Text("Mais Informações")
                }
                Section {
                    Button {
                        save()
                    } label: {
                        Text("Salvar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 4)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .listRowInsets(EdgeInsets())
                    .padding()
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Informações da Alergia")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .accessibilityLabel("Voltar")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        save()
                    } label: {
                        ZStack {
                            Image(systemName: "checkmark")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                        }
                        .frame(width: 25, height: 25)
                    }
                    .accessibilityLabel("Salvar")
                    .disabled(true)
                }
            }
        }
    }
    
    private func save() {
        dismiss()
    }
}

#Preview {
    AlergiaFormView(initialName: "Amendoim")
}
