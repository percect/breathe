import SwiftUI

struct ExerciseView: View {
    @State private var animationScale: CGFloat = 1.0
    @State private var isExerciseComplete = false
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                ForEach(0..<12) { index in
                    Circle()
                        .frame(width: 50, height: 50)
                        .offset(y: -50)
                        .rotationEffect(.degrees(Double(index) / 12 * 360))
                        .scaleEffect(animationScale)
                }
            }
            .onAppear {
                startExercise()
            }
            .opacity(isExerciseComplete ? 0 : 1) // Fade out when complete
            .animation(.easeInOut(duration: 1), value: isExerciseComplete)
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true) // Hide the back button
        .background(NavigationLink(destination: MainView(), isActive: $isExerciseComplete) { EmptyView() })
    }
    
    func startExercise() {
        let animationSequence: [CGFloat] = [2.0, 2.0, 1.0] // Scale for each phase
        let phaseDurations: [Double] = [4, 5, 4] // Duration for each phase
        
        // Execute the exercise cycle 3 times
        performCycle(currentCycle: 0, animationSequence: animationSequence, phaseDurations: phaseDurations)
    }
    
    func performCycle(currentCycle: Int, animationSequence: [CGFloat], phaseDurations: [Double]) {
        guard currentCycle < 3 else {
            // After 3 cycles, complete the exercise and fade out
            withAnimation(.easeInOut(duration: 1)) {
                isExerciseComplete = true
            }
            return
        }
        
        // Animate the current cycle phases
        withAnimation(.easeInOut(duration: phaseDurations[0])) {
            animationScale = animationSequence[0]
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + phaseDurations[0]) {
            withAnimation(.none) {
                animationScale = animationSequence[1]
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + phaseDurations[1]) {
                withAnimation(.easeInOut(duration: phaseDurations[2])) {
                    animationScale = animationSequence[2]
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + phaseDurations[2]) {
                    // Move to the next cycle
                    performCycle(currentCycle: currentCycle + 1, animationSequence: animationSequence, phaseDurations: phaseDurations)
                }
            }
        }
    }
}
