//
//  ListDoenca.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 03/07/26.
//

import SwiftUI

struct ListDoenca: View {
    
    @State var showPhotoPicker: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 5) {
                Text("Ainda não há registros ativos.")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
            }
            .navigationTitle("Doenças")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showPhotoPicker.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                    }
                }
                
            }
            .sheet(isPresented: $showPhotoPicker) {
                DoencasView()
            }
            
        }
    }
}
#Preview {
    ListDoenca()
}

