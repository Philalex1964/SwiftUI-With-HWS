//
//  ContentView.swift
//  GuessTheFlagProject
//
//  Created by Aleksandar Filipov on 3/15/22.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.black)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var attemptsCount = 0
    @State private var selectedFlag = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .titleStyle()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(image: countries[number])
                        }
                        .rotation3DEffect(.degrees(number  == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            
            .padding()
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
            Text("Your score is \(score)")
        }
        
        .alert(scoreTitle, isPresented: $showingFinalScore) {
                    Button("Restart", action: reset)
                } message: {
                    Text(scoreMessage)
                    Text("Your final score is \(score)")
                }
    }
    
    func flagTapped(_ number: Int) {
        selectedFlag = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMessage = "Your score is \(score)."
        } else {
            scoreTitle = "Wrong"
            score -= 1
            scoreMessage = "That’s the flag of \(countries[number])! Your score is \(score)."
        }

        attemptsCount += 1
        if attemptsCount == 3 {
            showingScore = false
            showingFinalScore = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        score = 0
        attemptsCount = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
"https://www.hackingwithswift.com/forums/100-days-of-swiftui/day-34-adding-animations-to-guesstheflag/10654"
"https://stackoverflow.com/questions/68272220/swift-ui-animation-360-degree-spin"
