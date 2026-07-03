//
//  Medicamento.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 26/06/26.
//

import SwiftUI
 
struct MedicamentosFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var nomeMedicamentos: String = ""
 
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                Image(systemName: "pills.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.indigo)
                    .padding(20)
               Spacer()
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding(12)
                        .glassEffect(.regular.interactive(), in: Circle())
                
                }
            }
            .padding(.top, 20)
 
            Text("Nome do Medicamento")
                .font(.title.bold())
 
            TextField("Ex.: Dipirona, insulina, pomada...", text: $nomeMedicamentos)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(25)
 
            Spacer()
 
            Button {

            } label: {
                Text("Seguinte")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(25)
            }
        }
        .padding()
       
    }
}
 
#Preview {
    NavigationStack {
        MedicamentosFormView()
    }
}
