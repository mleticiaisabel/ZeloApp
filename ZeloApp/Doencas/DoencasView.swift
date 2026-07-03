//
//  Medicamento.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 26/06/26.
//

import SwiftUI

struct DoencasView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var nomeDoencas: String = ""
    @State private var irParaProximaTela: Bool = false
    
    var body: some View {
        
        NavigationStack {
            HStack{
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Image(systemName: "cross.case.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.orange)
                            .padding(20)
                        Spacer()
                    }
                    
                    .padding(.top, 20)
                    
                    Text("Nome da\nDoença")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.primary)
                        .padding(.horizontal, 19)
                        .padding(.top, 4)
                    
                    TextField("Ex.: Diabete", text: $nomeDoencas)
                        .padding()
                        .background(Color(.systemGray5))
                    //                        .cornerRadius(25)
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    Button {
                        irParaProximaTela = true
                    } label: {
                        Text("Seguinte")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 17)
                            .background(nomeDoencas.isEmpty ? Color.gray:Color.green)
                            .clipShape(Capsule())
                    }
                    .disabled(nomeDoencas.isEmpty)
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
                .navigationDestination(isPresented: $irParaProximaTela) {
                    InfodoencaFormView(initialName: nomeDoencas)
                }
            }
        }
    }
}
#Preview {
    NavigationStack {
        DoencasView()
    }
}
