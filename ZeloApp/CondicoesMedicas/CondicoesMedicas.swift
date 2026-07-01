//
//  CondicoesMedicas.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 26/06/26.
//

import SwiftUI
 
struct CondicaoFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var nomeCondicao: String = ""
 
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                Image(systemName: "brain.filled.head.profile")
                    .font(.system(size: 80))
                    .foregroundColor(.brown)
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
                        .background(Circle().fill(Color.white))
                }
            }
            .padding(.top, 20)
 
            Text("Nome da Condição")
                .font(.title.bold())
 
            TextField("Ex.: Motora, física, mental...", text: $nomeCondicao)
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
        CondicaoFormView()
    }
}
