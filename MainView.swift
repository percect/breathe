import SwiftUI

struct MainView: View {
    @State private var showExplainer = false
    @State private var navigateToExercise = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("BREATHE")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                Spacer()
                
                FlowerAnimationView()
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                NavigationLink(destination: ExerciseView(), isActive: $navigateToExercise) {
                    Button(action: {
                        showExplainer = true
                    }) {
                        Text("Start Exercise")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showExplainer) {
                ExplainerView(showExplainer: $showExplainer, navigateToExercise: $navigateToExercise)
            }
        }
    }
}
