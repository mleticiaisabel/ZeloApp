import SwiftUI

struct DoencaFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var nomeDoenca: String = ""
    @State private var irParaProximaTela: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                Image(systemName: "cross.case.circle")
                    .font(.system(size: 80))
                    .foregroundColor(.orange)
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
                        .font(.headline)
                }
            }
            .padding(.top, 20)

            Text("Nome da Doença")
                .font(.title.bold())

            TextField("Ex.: Asma, diabetes, dengue...", text: $nomeDoenca)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(25)

            Spacer()

            Button {
                irParaProximaTela = true
            } label: {
                Text("Seguinte")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(25)
            }
            .disabled(nomeDoenca.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
        .navigationDestination(isPresented: $irParaProximaTela) {
            InfodoencaFormView(initialName: nomeDoenca)
        }
    }
}

#Preview {
    NavigationStack {
        DoencaFormView()
    }
}
