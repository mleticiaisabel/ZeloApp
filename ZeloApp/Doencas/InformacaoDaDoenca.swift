

//
//  InformacaoDaDoenca.swift
//  ZeloApp
//
//  Created by Alysson Lucas dos Anjos Silva on 02/07/26.
//

import SwiftUI
 

struct InfodoencaFormView: View {
 
    @Environment(\.dismiss) private var dismiss
 
    @State private var model = InfodoencaFormModel()
    
    init(initialName: String = "") { _model = State(initialValue: InfodoencaFormModel(name: initialName))
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome da doença", text: $model.name)
                        .font(.headline)
                }
                Section {
                    Picker(selection: $model.duration) {
                        ForEach(InfodoencaDuration.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    } label: {
                        EmptyView()
                    }
                    .pickerStyle(.menu)
                    .tint(.blue)
                } header: {
                    Text("Duração da Doença")
                }
                Section {
                    TextField("Ex.: Infecciosa, hereditária, Alérgica...", text: $model.origin)
                } header: {
                    Text("Origem")
                }
                Section {
                    Picker(selection: $model.status) {
                        ForEach(InfodoencaStatus.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    } label: {
                        EmptyView()
                    }
                    .pickerStyle(.menu)
                    .tint(.blue)
                } header: {
                    Text("Status da Doença")
                }
                Section {
                    TextField(
                        "Ex.: Falta de ar e tosse durante a noite...",
                        text: $model.symptoms,
                        axis: .vertical
                    )
                    .lineLimit(2...5)
                } header: {
                    Text("Sintomas")
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
                        "Ex.: Evitar poeira...",
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
            .navigationTitle("Informação da Doença")
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
    InfodoencaFormView()
}

