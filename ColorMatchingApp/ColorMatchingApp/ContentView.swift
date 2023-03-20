//
//  ContentView.swift
//  ColorMatchingApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

import SwiftUI

struct ContentView: View {
    /// create a Game
    @State var game = Game()
    // MARK: @State is a Source of Truth. If the UI should update when a SwiftUI view property’s value changes, you designate it as a @State property. In SwiftUI, when a @State property’s value changes, the view invalidates its appearance and recomputes the body.
    
    /// create a RGB
    @State var guess: RGB
    // MARK: It should be initialized in the previews if it's not initialized here
    
    @State var showScore = false
    
    /// create CGFloats
    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87
    
    var body: some View {
        GeometryReader { proxy in
            // MARK: GeometryReader provides you with a GeometryProxy object that has a frame method and size and safeAreaInset properties. You name this object proxy. Use GeometryReader to access the device’s frame and size properties.
            ZStack {
                
                /// ignore the safe area
                Color.element.ignoresSafeArea()
                
                VStack {
                    ColorCircle(rgb: game.target, size: proxy.size.height * circleSize)
                    
                    if !showScore {
                        BevelText(text: "R: ??? G: ??? B: ???", width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    } else {
                        BevelText(text: game.target.intString, width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    }
                    
                    ColorCircle(rgb: guess, size: proxy.size.height * circleSize)
                    
                    BevelText(text: guess.intString, width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                    
                    Button("Hit Me!") {
                        self.showScore = true
                        self.game.check(guess: guess)
                    }
                    .buttonStyle(
                        NeuButtonStyle(
                            width: proxy.size.width * buttonWidth,
                            height: proxy.size.height * labelHeight))
                    .alert(isPresented: $showScore) {
                        Alert(
                            title: Text("Your Score"),
                            message: Text(String(game.scoreRound)),
                            dismissButton: .default(Text("OK")) {
                                self.game.startNewRound()
                                self.guess = RGB()
                            })
                    }
                }
                .font(.headline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(guess: RGB())
            ContentView(guess: RGB()).previewDevice("iPhone 7")
        }
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    // MARK: @Binding is not a Source of Truth. You use @Binding instead of @State, because the ColorSlider view doesn’t own this data. It receives an initial value from its parent view and mutates it. In order to feed the @State property to Binding<T> you need to use the $ operator. @Binding creates a two-way connection (binding) between a property and another view.
    
    var trackColor: Color
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value).accentColor(trackColor)
            // MARK: By itself, value is just the value. It’s read-only. But $value is a read-write binding. You need it here to update the guess color while the user is changing the slider’s value.
            Text("255")
        }
        .font(.subheadline)
        .padding(.horizontal)
        // MARK: padding() adds 10 points around the view
    }
}
