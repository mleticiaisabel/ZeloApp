//
//  RemedioFormView.swift
//  ZeloApp
//
//  Created by Alysson Lucas dos Anjos Silva on 03/07/26.
//

import SwiftUI


struct RemedioFormView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var model = RemedioFormModel()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ForEach(TipoMedicamento.allCases) { tipo in
                        Button {
                            model.tipo = tipo
                        } label: {
                            HStack {
                                Text(tipo.rawValue)
                                    .foregroundStyle(.primary)
                                Spacer()
                                if model.tipo == tipo {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.green)
                                }
                            }
                        }
                    }
                } header: {
                    Text("Escolha o Tipo de Medicamento")
                }

                Section {
                    TextField("Nome do Tipo de Medicamento", text: $model.outroTipo)
                } header: {
                    Text("Outros Tipos")
                }

                Section {
                    TextField("Dosagem do Medicamento", text: $model.dosagem)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Adicione a Dosagem do Medicamento")
                }

                Section {
                    ForEach(UnidadeMedicamento.allCases) { unidade in
                        Button {
                            model.unidade = unidade
                        } label: {
                            HStack {
                                Text(unidade.rawValue)
                                    .foregroundStyle(.primary)
                                Spacer()
                                if model.unidade == unidade {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.green)
                                }
                            }
                        }
                    }
                } header: {
                    Text("Escolha a Unidade")
                }

                Section {
                    ForEach($model.horarios, id: \.self) { $horario in
                        DatePicker(
                            "Horário",
                            selection: $horario,
                            displayedComponents: .hourAndMinute
                        )
                    }
                    .onDelete { indexSet in
                        model.horarios.remove(atOffsets: indexSet)
                    }

                    Button {
                        model.horarios.append(Date())
                    } label: {
                        Label("Adicione um Horário", systemImage: "plus.circle.fill")
                            .foregroundStyle(Color.green)
                    }
                } header: {
                    Text("Defina o Horário")
                }

                Section {
                    Picker(selection: $model.frequencia) {
                        ForEach(FrequenciaMedicamento.allCases) { opcao in
                            Text(opcao.rawValue).tag(opcao)
                        }
                    } label: {
                        Text("Frequência")
                    }
                    .pickerStyle(.menu)
                    .tint(.blue)
                } header: {
                    Text("Dias que o Medicamento Será Tomado")
                }

                Section {
                    dataRow(
                        titulo: "Data de Início",
                        data: $model.dataInicio
                    )
                    dataRow(
                        titulo: "Data de Término",
                        data: $model.dataTermino
                    )
                } header: {
                    Text("Duração")
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
            .navigationTitle("Nome do Remédio")
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
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .accessibilityLabel("Fechar")
                }
            }
        }
    }

    @ViewBuilder
    private func dataRow(titulo: String, data: Binding<Date?>) -> some View {
        if let valor = data.wrappedValue {
            DatePicker(
                titulo,
                selection: Binding(
                    get: { valor },
                    set: { data.wrappedValue = $0 }
                ),
                displayedComponents: .date
            )
        } else {
            Button {
                data.wrappedValue = Date()
            } label: {
                HStack {
                    Text(titulo)
                        .foregroundStyle(.primary)
                    Spacer()
                    Text("Não definido")
                        .foregroundStyle(.blue)
                }
            }
        }
    }

    private func save() {
        dismiss()
    }
}

#Preview {
    RemedioFormView()
}
