//
//  TelaDeBoasVindas.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 26/06/26.
//

import SwiftUI

struct TelaDeBoasVindas: View {
    
    @State private var EntrarNoApp = false
    // o state é uma propriedade ou carcteristica do objeto, que, nesse caso, seria entrar no app
    
    var body: some View {
        
        if EntrarNoApp {
            EntradaDoAppView()
            
        } else {
            
            ZStack {
                LinearGradient(
                    colors: [
                        Color.green.opacity(0.60),
                        Color.green.opacity(0.15),
                        Color(.clear)],
                    startPoint: .top,
                    endPoint: .center
                )
                .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    Spacer()
                        .frame(height: 170)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Bem-vindo(a) ao")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .bold()
                        
                        Text("ZÉllo")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                            .bold()
                    }
                    Spacer()
                        .frame(height: 35)
                    
                    VStack(spacing: 30) {
                        
                        HStack (alignment: .top, spacing: 20) {
                            Image(systemName: "heart.text.clipboard.fill")
                                .font(Font.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(.green)
                                .font(.headline)
                            
                            //                                .frame(width: 80, height: 80)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text("Tudo sobre sua criança")
                                    .font(.title2)
                                    .bold()
                                
                                Text("Medicamentos, alergias e cuidados importantes em um só lugar.")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .bold()
                                //                                        .lineSpacing()
                                
                            }
                        }
                        
                        HStack (alignment: .top, spacing: 20) {
                            Image(systemName: "figure.and.child.holdinghands")
                                .font(Font.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(.green)
                                .font(.headline)
                            
                            //                                .frame(width: 80, height: 80)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text("Cuidado compartilhado")
                                    .font(.title2)
                                    .bold()
                                
                                Text("Mantenha familiares e responsáveis sempre informados.")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .bold()
                                //                                        .lineSpacing()
                            }
                        }
                        HStack (alignment: .top, spacing: 20) {
                            Image(systemName: "shield.righthalf.filled")
                                .font(Font.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(.green)
                                .font(.headline)
                            
                            //                                .frame(width: 80, height: 80)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text("Mais segurança no dia a dia")
                                    .font(.title2)
                                    .bold()
                                
                                Text("Reduz riscos causados pela falta de informação e cuide com mais confiança.")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .bold()
                                //                                        .lineSpacing()
                            }}
                    }
                }
                
            }
            
        }
        
    }
    
}
#Preview {
    TelaDeBoasVindas()
}
