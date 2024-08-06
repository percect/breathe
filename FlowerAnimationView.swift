import SwiftUI

struct FlowerAnimationView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            ForEach(0..<12) { index in
                Circle()
                    .frame(width: 50, height: 50)
                    .offset(y: isAnimating ? -100 : -30)
                    .rotationEffect(.degrees(Double(index) / 12 * 360))
                    .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}
