//
//  Medicamento.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 26/06/26.
//

import SwiftUI

struct MedicamentoView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var nomeMedicamentos: String = ""
    @State private var entrarNaLista = false
    
    var body: some View {
        
        NavigationStack {
            HStack{
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Image(systemName: "pills.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.indigo)
                            .padding(20)
                        Spacer()
                    }
                    
                    .padding(.top, 20)
                    
                    Text("Nome do\nMedicamento")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.primary)
                        .padding(.horizontal, 19)
                        .padding(.top, 4)
                    
                    TextField("Ex.: Dipirona", text: $nomeMedicamentos)
                        .padding()
                        .background(Color(.systemGray5))
//                        .cornerRadius(25)
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    Button {
                        entrarNaLista = true
                    } label: {
                        Text("Seguinte")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 17)
                            .background(nomeMedicamentos.isEmpty ? Color.gray:Color.green)
                            .clipShape(Capsule())
                    }
                    .disabled(nomeMedicamentos.isEmpty)
                }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action:  {
                            dismiss()
                        }) { Label ("", systemImage: "xmark")
                            
                        }
                    }
                }
                .padding(.horizontal, 35)
            }
        }
    }
}
#Preview {
    MedicamentoView()
}

