//
//  Alergias.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 26/06/26.
//

import SwiftUI
 
struct AlergiasView: View {
    @Environment(\.dismiss) var dismiss
    @State private var nomeAlergias: String = ""
    @State private var entrarNaLista = false
 
    
    
    
    var body: some View {
        
        NavigationStack {
            HStack{
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Image(systemName: "allergens")
                            .font(.system(size: 70))
                            .foregroundColor(.red)
                            .padding(20)
                        Spacer()
                    }
                    
                    .padding(.top, 20)
                    
                    Text("Nome da\nAlergia")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.primary)
                        .padding(.horizontal, 19)
                        .padding(.top, 4)
                    
                    TextField("Ex.: Poeira", text: $nomeAlergias)
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
                            .background(nomeAlergias.isEmpty ? Color.gray:Color.green)
                            .clipShape(Capsule())
                    }
                    .disabled(nomeAlergias.isEmpty)
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
    AlergiasView()
}

