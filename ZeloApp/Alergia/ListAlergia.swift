//
//  ListDoenca.swift
//  ZeloApp
//
//  Created by Maria Letícia Isabel Gonçalves  on 03/07/26.
//

import SwiftUI

struct ListAlergia: View {
    
    @State var showPhotoPicker: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack {
                    LinearGradient(
                        colors: [
                            Color.pink.opacity(0.60),
                            Color.pink.opacity(0.2),
                            Color(.clear)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 240)
                    Spacer()
                }
                .ignoresSafeArea()
                
                VStack(spacing: 5) {
                    Image(systemName: "allergens")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.pink)
                    
                    VStack(spacing: 5) {
                        Text("Ainda não há registros ativos.")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                    }
                    .navigationTitle("Alergia")
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
    }
}
#Preview {
    ListAlergia()
}

