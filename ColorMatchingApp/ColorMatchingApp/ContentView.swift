//
//  ContentView.swift
//  ColorMatchingApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var game = Game()
    
    @State var guess: RGB
    // MARK: It should be initialized in the previews if it's not initialized here
    
    @State var showScore = false
    
    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87
    
    var body: some View {
        GeometryReader { proxy in
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
    
    var trackColor: Color
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value).accentColor(trackColor)
            Text("255")
        }
        .font(.subheadline)
        .padding(.horizontal)
    }
}
