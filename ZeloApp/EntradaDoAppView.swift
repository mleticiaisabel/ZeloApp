//
//  ContentView.swift
//  ZeloApp
//  Created by Maria Letícia Isabel Gonçalves  on 25/06/26.
//

import SwiftUI

struct EntradaDoAppView: View {
    var body: some View {
        
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
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
            }
            .padding()
        }
    }
}

#Preview {
    EntradaDoAppView()
}
