import SwiftUI

struct ExplainerView: View {
    @Binding var showExplainer: Bool
    @Binding var navigateToExercise: Bool

    var body: some View {
        VStack {
            Text("Explainer")
                .font(.title)
                .padding()
            
            Text("When the circle gets bigger, you breathe in. When the circle gets smaller, you breathe out. When the circle maintains its size, you hold your breath.")
                .padding()
            
            Button(action: {
                showExplainer = false
                navigateToExercise = true
            }) {
                Text("Close")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}
