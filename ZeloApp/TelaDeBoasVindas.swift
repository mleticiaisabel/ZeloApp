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
                        Color.green.opacity(0.1),
                        Color(.clear)],
                    startPoint: .top,
                    endPoint: .center
                )
                .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    Spacer()
                        .frame(height: 190)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Bem-vindo(a) ao")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .bold()
                        
                        Text("Zéllo")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                            .bold()
                    }
                    Spacer()
                        .frame(height: 40)
                    
                    VStack(spacing: 40) {
                        
                        HStack (alignment: .top, spacing: 20) {
                            Image(systemName: "heart.text.clipboard.fill")
                                .font(Font.system(size: 23, weight: .bold, design: .rounded))
                                .foregroundColor(.green)
                                .font(.headline)
                                .frame(width: 30, height: 50)
                            
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text("Tudo sobre sua criança")
                                    .font(.title3)
                                    .bold()
                                
                                Text("Medicamentos, alergias e cuidados importantes em um só lugar.")
                                    .font(.body)
                                    .foregroundColor(.secondary)
//                                    .bold()
                                
                            }
                        }
                        
                        HStack (alignment: .top, spacing: 20) {
                            Image(systemName: "figure.and.child.holdinghands")
                                .font(Font.system(size: 23, weight: .bold, design: .rounded))
                                .foregroundColor(.green)
                                .font(.headline)
                                .frame(width: 30, height: 50)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text("Cuidado compartilhado")
                                    .font(.title3)
                                    .bold()
                                
                                Text("Mantenha familiares e responsáveis sempre informados.")
                                    .font(.body)
                                    .foregroundColor(.secondary)
//                                    .bold()
                                
                            }
                        }
                        HStack (alignment: .top, spacing: 20) {
                            Image(systemName: "shield.righthalf.filled")
                                .font(Font.system(size: 23, weight: .bold, design: .rounded))
                                .foregroundColor(.green)
                                .font(.headline)
                                .frame(width: 30, height: 50)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text("Mais segurança no dia a dia")
                                    .font(.title3)
                                    .bold()
                                
                                Text("Reduz riscos causados pela falta de informação e cuide com mais confiança.")
                                    .font(.body)
                                    .foregroundColor(.secondary)
//                                    .bold()
                            }
                        }
                    }
                    Spacer ()
                    
                    Button{
                        EntrarNoApp = true
                        
                    } label: {
                        
                        Text("Começar")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 124)
                            .background(Color.green)
                            .clipShape(Capsule())
                    }
//                    .buttonStyle(.plain)
//                    .padding(.bottom)
                }
                .padding(.horizontal, 35)
            }
            
        }
        
    }
    
}

#Preview {
    TelaDeBoasVindas()
}
