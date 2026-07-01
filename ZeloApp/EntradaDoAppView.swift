//
//  ContentView.swift
//  ZeloApp
//  Created by Maria Letícia Isabel Gonçalves  on 25/06/26.
//

import SwiftUI

struct EntradaDoAppView: View {
    
    var body: some View {
        
        NavigationStack {
            
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
                
                VStack {
                    Text(Date(),format: .dateTime.weekday(.wide).day().month(.wide))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .environment(\.locale, Locale(identifier: "pt_BR"))
                        .bold()
                    
                }
                .navigationTitle("Saúde")
                .navigationBarTitleDisplayMode(.automatic)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 19)
                .padding(.top, -338)
            }
        }
    }
}

#Preview {
    EntradaDoAppView()
}
